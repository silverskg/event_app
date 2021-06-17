document.addEventListener('turbolinks:load', () => {
  const TODAY = new Date(new Date().setHours(0, 0, 0, 0))
    const A_MONTH_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth() - 1, TODAY.getDate())
    const A_MONTH_AHEAD = new Date(TODAY.getFullYear(), TODAY.getMonth() + 2, TODAY.getDate())
    // 選択できない日付データ（自由に変更していただいてOKです）
    const DISABLE_DATES = ['2019-12-10', '2019-12-20', '2019-12-30', '2020-01-10', '2020-1-20', '2020-01-30']

    // カレンダーの日本語化
    flatpickr.localize(flatpickr.l10ns.ja)

    // カレンダーの表示
    flatpickr('#date-form', {
        // スマートフォンでもカレンダーに「flatpickr」を使用
        disableMobile: true,
        // 1ヶ月前から本日まで選択可
        minDate: A_MONTH_AGO,
        maxDate: A_MONTH_AHEAD,
        // 選択できない日付
        disable: DISABLE_DATES
    })
});