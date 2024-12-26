"use strict";

// set global array for checked recipients rows [id]
var recipientsArr = [];

$(document).ready(function() {
    
    //start spin email icon
    $('.site_title i').addClass('fa-spin');
    
    $('#newtags').select2({
        width: 'resolve'
    }).on('update change', function() {
        $('#mojetagi').val($('#newtags').val());
    });
    
    // MODALS SECTION
    //
    // manage tags modal
    $('#recipientsTagsManager').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget);
        var modal = $(this);
    });
    // manage delete modal
    $('#recipientDelete').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget);
        var recipientname = button.data('recipientname');
        var recipientid = button.data('recipientid');
        var recipientemail = button.data('recipientemail');
        var modal = $(this);
        modal.find('.recipientname').val(recipientname + ', (' + recipientemail + ')');
        modal.find('.recipientid').val(recipientid);
    });
    //manage recipients delete modal
    $('#recipientsDelete').on('show.bs.modal', function(event) {
        $('#del_search').val($('#recipients_filter label input').val());
        $('#del_tags').val($("input[name=mojetagi]").val());
        $('#del_logic').val($("input[name=mojequery]").val());
    });
    //manage recipients verify modal
    $('#recipientsVerify').on('show.bs.modal', function(event) {
        $('#verifyInfo').html(lang_b_ver_info);
    });
    //
    // END OF MODALS
    
    
    
    // DATATABLE SECTION
    //
    
    // extend datatable button class
    $.fn.dataTableExt.oStdClasses.sPageButton = "btn btn-default";
    
    //setup datatable
    var oTable = $('#recipients').DataTable({
        stateSave: true,
        language: dataTableTranslation,
        processing: true,
        serverSide: true,
        lengthMenu: [[5, 10, 25, 100, 1000], [5, 10, 25, 100, 1000]],
        order: [[ 1, "asc" ]],
        ajax: {
            url: "index.php?manage=recipient&data=modify&action=getlist",
            type: "POST",
            data: function (d) {
                return $.extend( {}, d, {
                    csrf_token: $('body').attr('data-crsftoken'),
                    logic: $("input[name=mojequery]").val(),
                    tags: $('#mojetagi').val()
                }
                );
            }
        },
        columns: [
            { data: "id",
                render: function (id) {
                return  '<label class="markers" for="marker_' + id + '">' +
                            '<div class="icheckbox_flat">' +
                            '<input id="marker_' + id + '" type="checkbox" value="' + id + '" data-id="' + id + '" class="marker">' +
                            '<ins class="iCheck-helper" ></ins>' +
                            '</div>' +
                        '</label>';
                },
                className: 'chkPerson',
                orderable: false
            },
/*
            { data: {"person": ["id", "person"]}, 
                render: function (dane) {
                    return '<a href="index.php?manage=recipient&amp;action=edit&amp;id=' + dane.id + '">' + dane.person + '</a>';
                }
            },
*/
            { data: "person" },
            
            { data: "email" },
            { data: "tag" },
            { data: "comment" },
            { data: "website" },
            { data: "f01" },
            { data: "f02" },
            { data: "f03" },
            { data: "verified" },
            {   data: "button",
                orderable: false
            }
        ],
        fnDrawCallback: function( oSettings ) {
            $('#qtyToDelete').html( this.fnSettings().fnRecordsDisplay() );
            $('#qtyToVerify').html( this.fnSettings().fnRecordsDisplay() );
            $('#recordsTotal').html( '(' + oSettings._iRecordsDisplay + '/' + oSettings._iRecordsTotal + ')' );
            $('#qtyToTagsManage').html( this.fnSettings().fnRecordsDisplay() );
            $('#qtyToTagsManage').attr('data-table', this.fnSettings().fnRecordsDisplay() );

            $('.site_title i').removeClass('fa-spin');
            verify();
            recipientsArr.length = 0;
            
            $('input.marker').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green',
                fireChange: true
            }).on('ifChanged', function(e) {
                var qty = $('.marker:checked').length,
                    qtyAll = $('.marker').length,
                    isChecked = e.currentTarget.checked,
                    id = $(e.target).attr('data-id'),
                    pos = 0
                    ;
                if (isChecked == true) {
                    $(e.target).parent().parent().parent().parent().parent().addClass('rowSelected');
                    recipientsArr.push(id);
                } else {
                    $(e.target).parent().parent().parent().parent().parent().removeClass('rowSelected');
                    pos = recipientsArr.indexOf(id);
                    recipientsArr.splice(pos, 1);
                }
                if (qty == 0) {
                    $('#markAll').prop('checked', false).parent().removeClass('checked');
                }
                if (qty == qtyAll) {
                    $('#markAll').prop('checked', true).parent().addClass('checked');
                }
            });
            
            $('#markAll').prop('checked', false).parent().removeClass('checked');
          
        }
    });
    // END OF DATATABLE SECTION
    
    
    // search tags management
    $('input.flat').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green',
        fireChange: true
    }).on('ifChanged', function(e) {
        var id = $(e.target).attr('id');
        var isChecked = e.currentTarget.checked;
        
        $(e.target).prop("checked", e.currentTarget.checked === true ? true : false);
        if (isChecked == true) {
            $('#' + id).attr('checked', 'checked');
        } else {
            $('#' + id).removeAttr('checked');
        }
        
        $('#mojetagi').val($('#newtags').val());
        
        if (id == 'OR' || id == 'AND') {
            $('#mojequery').val(id);
        }
        
    });
    
    
    $("div.dataTables_filter").append("<a id='mySearch' class='btn btn-primary btn-xs'>go</a>");
    $("div.dataTables_filter input").off();
    $("div.dataTables_filter input").on('keydown', function(e) {
        if (e.which == 13) {
            oTable.search( $("div.dataTables_filter input").val()).draw();
        }
    });
    
    // clicked 'go' button
    $("#mySearch").on('click', function(e) {
        var searchPhrase = $("div.dataTables_filter input").val();
        var globalSearch = $('#recipients_filter label input[type=search]').val();
        var globalLogic = $('input[name=mojequery]').val()
        var globalTags = $("input[name=mojetagi]").val();
        
        oTable.search(searchPhrase).draw();
        $('#del_search').val(searchPhrase);
        $('#del_tags').val($("input[name=mojetagi]").val());
        $('#del_logic').val($("input[name=mojequery]").val());
        $('#ver_search').val(searchPhrase);
        $('#ver_tags').val($("input[name=mojetagi]").val());
        $('#ver_logic').val($("input[name=mojequery]").val());
            
        $('#globalSearch').val(globalSearch);
        $('#globalLogic').val(globalLogic);
        $('#globalTags').val(globalTags);

    });
    $(".resetquery").on('click', function(e) {
        e.preventDefault();
        $.each($('input[type=checkbox]'), function() {
            $(this).prop('checked', false).removeAttr('checked').parent().removeClass('checked');
        });
        $("input[name=mojetagi]").val('');
        $('#del_search').val('');
        $('#del_tags').val('');
        $('#del_logic').val('');
        $('#ver_search').val('');
        $('#ver_tags').val('');
        $('#ver_logic').val('');
        $("#newtags").val('').trigger('change');
        
        oTable.search('').columns().search('').draw();
        
        
        $('#globalSearch').val('');
        $('#globalLogic').val('');
        $('#globalTags').val('');
    });
    
    verifyBulk();
    addMarkAllAction();
    bulkTagsManager();

// end of $(document).ready
});
    

// get recipients quantity for tags modal
function bulkTagsManager()
{
    $('#bulkTagsManager').on('click', function() {
        var qty = $('.marker:checked').length;
        if ( qty > 0 ) {
            $('#qtyToTagsManage').html($('.marker:checked').length);
            $('#part1').removeClass('hidden');
            $('#part2').addClass('hidden');
        } else {
            $('#qtyToTagsManage').html(0);
            $('#part1').addClass('hidden');
            $('#part2').removeClass('hidden');
        }
        $('#recipientsArr').val(recipientsArr);
    });
}

// MARK ALL select/unselect all rows
function addMarkAllAction()
{
    $('#global *').on('click', function() {
        if ($('#markAll').is(':checked')) {
            recipientsArr.length = 0;
            $('.marker').prop('checked', true).parent().addClass('checked');
            $('#recipients tbody tr').addClass('rowSelected');
            $('input.marker:checked').each( function() {
                recipientsArr.push($(this).attr('data-id'));
            });
        } else {
            recipientsArr.length = 0;
            $('.marker').prop('checked', false).parent().removeClass('checked');
            $('#recipients tbody tr').removeClass('rowSelected');
        }
    });
}

// verify one recipent mail
function verify() {
    $('.verify').off();
    $('.verify').on('click', function() {
        var button = $(this),
            id = button.attr('data-recipientid');
        
        button.addClass('disabled').addClass('btn-dark').removeClass('btn-info');
        $.ajax({
            method: 'POST',
            url: 'index.php?manage=recipient&data=modify&action=verify',
            data : {
                csrf_token: $('input[name=csrf_token]').val(),
                id: id
            }
        }).done(function(res){
            $('#v_' + id).html(res);
            button.removeClass('disabled').addClass('btn-info').removeClass('btn-dark');
        });

    });
}

// prepare bul verification
function verifyBulk() {
    $('#verify_recipients').off();
    $('#verify_recipients').on('click', function() {
        var button = $(this),
            ver_search = $('#ver_search').val(),
            ver_tags = $('#ver_tags').val(),
            ver_logic = $('#ver_logic').val();
        
        button.addClass('disabled').addClass('btn-dark').removeClass('btn-info').html('working...');
        
        $('#verifyInfo').html(lang_b_ver_in_prog);
        $.ajax({
            method: 'POST',
            url: 'index.php?manage=recipient&data=modify&action=verify_bulk',
            data : {
                csrf_token: $('input[name=csrf_token]').val(),
                ver_search: ver_search,
                ver_tags: ver_tags,
                ver_logic : ver_logic,
                ver_qty : $('#qtyToVerify').html()
            },
            statusCode: {
                400: function() {
                    $('#verifyInfo').html('Bad request.');
                },
                404: function() {
                    alert( "page not found" );
                }
            }
        }).done(function(res){
            $('#verifyInfo').html(res);
            button.removeClass('disabled').addClass('btn-info').removeClass('btn-dark').html(lang_verify);
        });

    });
}