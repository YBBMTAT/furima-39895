document.addEventListener('turbo:load', () => {
  console.log("DOM content loaded");
 const priceInput = document.getElementById('item-price'); // 金額を入力した数値をpriceInputという変数に格納する
 const addTaxDom = document.getElementById('add-tax-price'); // 販売手数料の数値をaddTaxDomという変数に格納する
 const profitDom = document.getElementById('profit'); // 販売利益の数値をprofitDomという変数に格納する

 const updateResults = () => {
  const inputValue = priceInput.value;//価格入力
  const calculatedTax = isNaN(inputValue) ? "" : Math.floor(inputValue * 0.1);//手数料計算
  const calculatedProfit = isNaN(inputValue) ? "" : inputValue - calculatedTax;//利益計算
 
  //計算結果表示
  addTaxDom.textContent = calculatedTax;
  profitDom.textContent = calculatedProfit;
 };
  //イベント発火
  priceInput.addEventListener("input", () => {
    console.log("Input event detected");
    updateResults(); //計算結果更新
  });

  updateResults();//計算結果更新
});