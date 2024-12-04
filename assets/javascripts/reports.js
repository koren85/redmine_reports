$(document).ready(function() {
    // Обработка изменения фильтров
    $('#query_form select, #query_form input').change(function() {
        $(this).closest('form').submit();
    });

    // Сохранение состояния сортировки
    $('.sort a').click(function() {
        localStorage.setItem('reports_sort', $(this).data('sort'));
    });

    // Инициализация сохраненной сортировки
    var savedSort = localStorage.getItem('reports_sort');
    if (savedSort) {
        var $sortLink = $('.sort a[data-sort="' + savedSort + '"]');
        if ($sortLink.length) {
            $sortLink.click();
        }
    }

    // Фиксированные заголовки при прокрутке
    var tableHeader = $('.sticky-headers thead');
    if (tableHeader.length) {
        var headerTop = tableHeader.offset().top;
        $(window).scroll(function() {
            var scrollTop = $(window).scrollTop();
            if (scrollTop > headerTop) {
                tableHeader.addClass('fixed');
            } else {
                tableHeader.removeClass('fixed');
            }
        });
    }
});