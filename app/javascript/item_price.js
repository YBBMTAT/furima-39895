window.addEventListener('turbo:load', () => {

// 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById('item-price');
//クリックする度イベント発火
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;


// 販売手数料の数値をaddTaxDomという変数に格納する
const addTaxDom = document.getElementById('add-tax-price');
//入力した金額をもとに販売手数料(10%)を計算する処理、全角時のNaNの非表示
addTaxDom.innerHTML = isNaN(inputValue) ? "" : Math.floor(inputValue * 0.1);

// 販売利益の数値をprofitDomという変数に格納する
const profitDom = document.getElementById('profit');
//入力した金額をもとに利益を計算する処理、全角時のNaNの非表示
profitDom.innerHTML = isNaN(inputValue) ? "" : inputValue - addTaxDom.innerHTML;
})
});