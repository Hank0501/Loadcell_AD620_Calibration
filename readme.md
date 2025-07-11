# Loadcell 校正

## 整體流程
1. 更改陣列 "weight", 裡面元素為每次放的砝碼重量，實驗放砝碼的順序須按照元素順序
2. run 程式，用 STMstudio 抓資料
3. 按下Reset之後等一下，LD5亮起，代表可以開始放砝碼
4. 放好砝碼後，按下user button，LD3亮起，程式開始記錄Loadcell值，請勿觸碰Loadcell
5. Loadcell值記錄完成後，LD3熄滅，重複步驟4
6. 當陣列 "weight"裡的砝碼順序都放完後，再按一次user button，所有板上LED燈都亮，可以確認是否有某次漏放
7. STMstudio 抓完資料後，使用MATLAB Processing資料夾內的檔案處理資料，計算Loadcell Gain值