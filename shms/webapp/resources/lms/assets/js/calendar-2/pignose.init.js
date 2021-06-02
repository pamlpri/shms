$(function() {
    "use strict";
    $('.year-calendar').pignoseCalendar({
        lang : "ko",
        theme: 'blue', // light, dark, blue
        disabledDates: [
            '2021-05-01',
            '2021-05-04',
            '2021-05-11',
            '2021-05-06',
            '2021-05-07',
            '2021-05-15',
            '2021-05-12',
            '2021-05-03',
            '2021-05-25',
        ]
    });
});

