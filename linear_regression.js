
// CREATE PNGS FOR THE LINEAR REGRESSION CHARTS
// https://stackoverflow.com/questions/16661565/displaying-an-image-when-selecting-an-option-from-a-drop-down-list

function setChart() {
    var img = document.getElementById("image");
    img.src = this.value;
    return false;
}
document.getElementById("LinearRegressionCharts").onchange = setCar;