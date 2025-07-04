/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2025 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "adc.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "stdbool.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
#define ALPHA_LOADCELL 0.99
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

uint32_t cur_loadcell;
uint32_t pre_loadcell;
float filtered_cur_loadcell;
float filtered_pre_loadcell;

int record_flag;
uint32_t start_tick;

int counter;

// int weight[21] = {0, 50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 450, 400, 350, 300, 250, 200, 150, 100, 50, 0};
int weight[2] = {0, 5};
int weight_variable;

// float measure_weight;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
 * @brief  The application entry point.
 * @retval int
 */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_ADC1_Init();
  /* USER CODE BEGIN 2 */

  HAL_ADC_Start(&hadc1);

  record_flag = 0;
  start_tick = 0;
  counter = 0;
  weight_variable = 0;

  if (HAL_ADC_PollForConversion(&hadc1, 2) == HAL_OK)
  {
    cur_loadcell = HAL_ADC_GetValue(&hadc1);
  }
  filtered_cur_loadcell = cur_loadcell;
  HAL_Delay(4000);

  // LD5 on means calibration process is ready.
  HAL_GPIO_WritePin(GPIOD, LD5_Pin, GPIO_PIN_SET);
  HAL_GPIO_WritePin(GPIOD, LD3_Pin, GPIO_PIN_RESET);

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

    // ------------------------------------------------------------ //
    // ------------------------- Calibration ---------------------- //
    // ------------------------------------------------------------ //

    pre_loadcell = cur_loadcell;
    filtered_pre_loadcell = filtered_cur_loadcell;

    if (HAL_ADC_PollForConversion(&hadc1, 2) == HAL_OK)
    {
      cur_loadcell = HAL_ADC_GetValue(&hadc1);
    }

    // Low Pass Filter
    filtered_cur_loadcell = ALPHA_LOADCELL * filtered_pre_loadcell + (1 - ALPHA_LOADCELL) * ((float)cur_loadcell + (float)pre_loadcell) / 2;

    if (counter <= sizeof(weight) / sizeof(weight[0]))
    {
      uint32_t time_pass = HAL_GetTick() - start_tick;
      if (time_pass > 300 && time_pass < 3000)
      {
        HAL_GPIO_WritePin(GPIOD, LD3_Pin, GPIO_PIN_SET);
        record_flag = 1;
      }
      else if (time_pass >= 3000)
      {
        HAL_GPIO_WritePin(GPIOD, LD3_Pin, GPIO_PIN_RESET);
        record_flag = 0;
      }
    }
    else
    {
      // All LED on means the whole calibration process is over.
      HAL_GPIO_WritePin(GPIOD, LD3_Pin, GPIO_PIN_SET);
      HAL_GPIO_WritePin(GPIOD, LD4_Pin, GPIO_PIN_SET);
      HAL_GPIO_WritePin(GPIOD, LD5_Pin, GPIO_PIN_SET);
      HAL_GPIO_WritePin(GPIOD, LD6_Pin, GPIO_PIN_SET);
    }
  }
  /* USER CODE END 3 */
}

/**
 * @brief System Clock Configuration
 * @retval None
 */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
   */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
   * in the RCC_OscInitTypeDef structure.
   */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 7;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
   */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
  if (GPIO_Pin == GPIO_PIN_0)
  {
    static uint32_t last_tick = 0;
    if (HAL_GetTick() - last_tick > 500) // wait 500ms
    {
      last_tick = HAL_GetTick();
      if (!record_flag && counter < sizeof(weight) / sizeof(weight[0]))
      {
        // LD3 on means STM is recording the loadcell data.
        HAL_GPIO_WritePin(GPIOD, LD3_Pin, GPIO_PIN_SET);
        weight_variable = weight[counter];
        start_tick = HAL_GetTick();
      }

      counter++;
    }
  }

  else
  {
    __NOP();
  }
}
/* USER CODE END 4 */

/**
 * @brief  This function is executed in case of error occurrence.
 * @retval None
 */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef USE_FULL_ASSERT
/**
 * @brief  Reports the name of the source file and the source line number
 *         where the assert_param error has occurred.
 * @param  file: pointer to the source file name
 * @param  line: assert_param error line source number
 * @retval None
 */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
