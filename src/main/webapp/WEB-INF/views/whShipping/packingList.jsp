<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/WEB-INF/base/taglibs.jsp" %>
<s:layout-render name="/WEB-INF/base/base.jsp">
    <s:layout-component name="page_css">
        <link rel="stylesheet" href="${contextPath}/resources/private/datatables/css/jquery.dataTables.css" type="text/css" />
        <link rel="stylesheet" href="${contextPath}/resources/private/datatables/css/buttons.dataTables.min.css" type="text/css" />
        <!--<link rel="stylesheet" href="${contextPath}/resources/private/datatables/css/dataTables.tableTools.css" type="text/css" />-->
    </s:layout-component>
    <s:layout-component name="page_css_inline">
        <style>
            @media print {
                /*                table  {
                                    border-top: #000 solid 1px;
                                    border-bottom: #000 solid 1px;
                                    border-left: #000 solid 1px;
                                    border-right: #000 solid 1px;
                                }*/
                table thead {
                    border-top: #000 solid 2px;
                    border-bottom: #000 solid 2px;
                }
                table tbody {
                    border-top: #000 solid 2px;
                    border-bottom: #000 solid 2px;
                }
            }
            .dataTables_wrapper .dt-buttons {
                float:none;  
                text-align:right;
            }
        </style>
    </s:layout-component>
    <s:layout-component name="page_container">
        <div class="col-lg-12">
            <h1>Warehouse Management - HW for Shipment to Rel Lab</h1>
            <div class="row">
                <div class="col-lg-8">
                    <div class="main-box">
                        <h2>Add New Material Pass Number</h2>
                        <form id="add_mp_list_form" class="form-horizontal" role="form" action="${contextPath}/wh/whShipping/save" method="post">
                            <div class="form-group">
                                <label for="materialPassNo" class="col-lg-3 control-label">Material Pass Number *</label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" id="materialPassNo" name="materialPassNo" placeholder="" value="" autofocus="autofocus">
                                </div>
                            </div>
                            <a href="${contextPath}/wh/whRequest/ship" class="btn btn-info pull-left"><i class="fa fa-reply"></i> Back</a>
                            <div class="pull-right">
                                <button type="reset" class="btn btn-secondary cancel">Reset</button>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>	
            </div>
        </div>
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-box clearfix">
                        <div class="clearfix">
                            <h2 class="pull-left">HIMS–SF Shipping List</h2>
                            <div class="filter-block pull-right">
                                <a href="#delete_modal" data-toggle="modal" class="btn btn-danger danger group_delete pull-right" onclick="modalDelete(this);">
                                    <i class="fa fa-trash-o fa-lg"></i> Delete All
                                </a>
                            </div>
                        </div>
                        <div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            *Please delete all data after print the shipping material pass number list.
                        </div>    
                        <hr/>
                        <div class="clearfix">
                            <div class="form-group pull-left">
                                <select id="dt_spml_rows" class="form-control">
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>
                            <div class="filter-block pull-right">
                                <div id="dt_spml_tt" class="form-group pull-left" style="margin-right: 5px;">
                                </div>
                                <div class="form-group pull-left" style="margin-right: 0px;">
                                    <input id="dt_spml_search" type="text" class="form-control" placeholder="<f:message key="general.label.search"/>">
                                    <i class="fa fa-search search-icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <a href="${contextPath}/wh/whShipping/email" class="btn btn-info pull-right" id="print"><i class="fa fa-print"></i> Print</a>
                        </div>
                        <div class="table-responsive">
                            <table id="dt_spml" class="table">
                                <thead>
                                    <tr>
                                        <th><span>No</span></th>
                                        <th><span>Material Pass Number</span></th>
                                        <th><span>Material Pass Expiry Date</span></th>
                                        <th><span>Hardware Type</span></th>
                                        <th><span>Hardware ID</span></th>
                                        <th><span>Quantity</span></th>
                                        <th><span>Manage</span></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${packingList}" var="packingList" varStatus="packingListLoop">
                                        <tr>
                                            <td><c:out value="${packingListLoop.index+1}"/></td>
                                            <td><c:out value="${packingList.materialPassNo}"/></td>
                                            <td><c:out value="${packingList.materialPassExpiry}"/></td>
                                            <td><c:out value="${packingList.equipmentType}"/></td>
                                            <td><c:out value="${packingList.equipmentId}"/></td>
                                            <td><c:out value="${packingList.quantity}"/></td>
                                            <td align="center">
                                                <a modaldeleteid="${packingList.requestId}" data-toggle="modal" href="#delete_modal" class="table-link danger group_delete" onclick="modalDelete(this);">
                                                    <span class="fa-stack">
                                                        <i class="fa fa-square fa-stack-2x"></i>
                                                        <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                                    </span>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </s:layout-component>
    <s:layout-component name="page_js">
        <!--print-->
        <script src="${contextPath}/resources/private/datatables/js/jquery.dataTables.min.js"></script>
        <script src="${contextPath}/resources/private/datatables/js/dataTables.buttons.min.js"></script>
        <script src="${contextPath}/resources/private/datatables/js/buttons.print.min.js"></script>
        <script src="${contextPath}/resources/private/datatables/js/buttons.flash.min.js"></script>
        <script src="${contextPath}/resources/private/datatables/js/buttons.html5.min.js"></script>
    </s:layout-component>
    <s:layout-component name="page_js_inline">
        <script>
            $(document).ready(function () {
                //temporary disabled
                $('#materialPassNo').bind('copy paste cut', function (e)  {
                    e.preventDefault(); //this line will help us to disable cut,copy,paste  
                });
                
                var validator = $("#add_mp_list_form").validate({
                    rules: {
                        materialPassNo: {
                            required: true
                        }
                    }
                });
                $(".cancel").click(function () {
                    validator.resetForm();
                });
                
                oTable = $('#dt_spml').DataTable({
                    dom: 'Bfrtip'
                });

                $('#dt_spml_search').keyup(function () {
                    oTable.search($(this).val()).draw();
                });

                $("#dt_spml_rows").change(function () {
                    oTable.page.len($(this).val()).draw();
                });
            });

//            function printDiv() {
//                var divToPrint = document.getElementById("dt_spml");
//                var htmlToPrint = '' +
//                        '<style type="text/css">' +
//                        'table th, table td {' +
//                        'font-size: 12px;' +
//                        'text-align: left;' +
//                        'padding;0.5em;' +
//                        '}' +
//                        '</style>';
//                htmlToPrint += divToPrint.outerHTML;
//                newWin = window.open("");
//                newWin.document.write(htmlToPrint);
//                newWin.print();
//                newWin.close();
//                location.href = 'http://fg79cj-l1:8080/HMS/wh/whShipping/email';
//            }
//
//            $('#print').on('click', function () {
//                printDiv();
//            })

            function modalDelete(e) {
                var deleteUrl = "${contextPath}/wh/whShipping/deleteAll";
                var deleteMsg = "Are you sure want to delete all? All related data will be deleted.";
                $("#delete_modal .modal-body").html(deleteMsg);
                $("#modal_delete_button").attr("href", deleteUrl);
            }          
        </script>
    </s:layout-component>
</s:layout-render>