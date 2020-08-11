am4core.ready(function() {
    // Themes begin
    am4core.useTheme(am4themes_animated);
    // Themes end

    // **********************************
    // ***** ESTADISTICAS GENERALES *****
    // 1. Cifras generales sobre casos confirmados
    var generalCifrasConfirmadas = am4core.create("estadisticas-generales-cifras-nacionales", am4charts.XYChart);
    generalCifrasConfirmadas.data = [{
        "estado": "Confirmados",
        "casos": 47454
    }, {
        "estado": "Recuperados",
        "casos": 6597
    }, {
        "estado": "Muertes",
        "casos": 1495
    }];
    var categoria_GeneralCifrasConfirmadas = generalCifrasConfirmadas.xAxes.push(new am4charts.CategoryAxis());
    categoria_GeneralCifrasConfirmadas.dataFields.category = "estado";
    categoria_GeneralCifrasConfirmadas.renderer.grid.template.location = 0;
    categoria_GeneralCifrasConfirmadas.renderer.minGridDistance = 30;
    categoria_GeneralCifrasConfirmadas.renderer.labels.template.adapter.add("dy", function(dy, target) {
        if (target.dataItem && target.dataItem.index & 2 == 2) {
            return dy + 25;
        }
        return dy;
    });
    var valueAxis_GeneralCifrasConfirmadas = generalCifrasConfirmadas.yAxes.push(new am4charts.ValueAxis());
    var series = generalCifrasConfirmadas.series.push(new am4charts.ColumnSeries());
    series.dataFields.valueY = "casos";
    series.dataFields.categoryX = "estado";
    series.name = "casos";
    series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
    series.columns.template.fillOpacity = .8;
    var plantillaColumna_GeneralCifrasConfirmadas = series.columns.template;
    plantillaColumna_GeneralCifrasConfirmadas.strokeWidth = 2;
    plantillaColumna_GeneralCifrasConfirmadas.strokeOpacity = 1;

    // **********************************
    // ****** ESTADISTICAS LOCALES ******
    // 1. Sintomas comunes
    var localSintomasComunes = am4core.create("estadisticas-locales-sintomas-comunes", am4charts.XYChart);
    localSintomasComunes.data = [{
        "sintomaComun": "Tos",
        "personas": 2
    }, {
        "sintomaComun": "Fiebre",
        "personas": 2
    }, {
        "sintomaComun": "Diarrea",
        "personas": 2
    }];
    var categoria_LocalSintomasComunes = localSintomasComunes.xAxes.push(new am4charts.CategoryAxis());
    categoria_LocalSintomasComunes.dataFields.category = "sintomaComun";
    categoria_LocalSintomasComunes.renderer.grid.template.location = 0;
    categoria_LocalSintomasComunes.renderer.minGridDistance = 30;
    categoria_LocalSintomasComunes.renderer.labels.template.adapter.add("dy", function(dy, target) {
        if (target.dataItem && target.dataItem.index & 2 == 2) {
            return dy + 25;
        }
        return dy;
    });
    var valueAxis_LocalSintomasComunes = localSintomasComunes.yAxes.push(new am4charts.ValueAxis());
    series = localSintomasComunes.series.push(new am4charts.ColumnSeries()); // * Probar reutilizar variables
    series.dataFields.valueY = "personas";
    series.dataFields.categoryX = "sintomaComun";
    series.name = "personas";
    series.columns.template.tooltipText = "{categoryX}: [bold]{valueY}[/]";
    series.columns.template.fillOpacity = .8;
    var plantillaColumna_LocalSintomasComunes = series.columns.template;
    plantillaColumna_LocalSintomasComunes.strokeWidth = 2;
    plantillaColumna_LocalSintomasComunes.strokeOpacity = 1;


}); // end am4core.ready()