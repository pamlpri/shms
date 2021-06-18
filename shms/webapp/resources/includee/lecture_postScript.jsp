<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 21.      박초원        최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- General JS Scripts -->
	<script src="${cPath }/resources/lecture/dist/modules/jquery.min.js" type="text/javascript"></script>
  	<script src="${cPath }/resources/lecture/dist/modules/popper.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/tooltip.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/nicescroll/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/moment.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/js/stisla.js" type="text/javascript"></script>

	<!-- JS Libraies -->
	<script src="${cPath }/resources/lecture/dist/modules/simple-weather/jquery.simpleWeather.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/chart.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/jqvmap/dist/jquery.vmap.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/jqvmap/dist/maps/jquery.vmap.world.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/chocolat/dist/js/jquery.chocolat.min.js" type="text/javascript"></script>
	
	<!-- JS Libraies -->
	<script src="${cPath }/resources/lecture/dist/modules/datatables/datatables.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/datatables/Select-1.2.4/js/dataTables.select.min.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/modules/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
	
	<!-- Page Specific JS File -->
	<script src="${cPath }/resources/lecture/dist/js/page/modules-datatables.js" type="text/javascript"></script>

	<!-- Template JS File -->
	<script src="${cPath }/resources/lecture/dist/js/scripts.js" type="text/javascript"></script>
	<script src="${cPath }/resources/lecture/dist/js/custom.js" type="text/javascript"></script>
	
	<script src="${cPath }/resources/lecture/dist/js/jquery.table2excel.min.js"></script>
	<script>
	function ReportToExcelConverter() {
		$('<table>').append(
           $("#report-table").DataTable().$('tr').clone()
        ).table2excel({
			exclude: ".noExl"
			, name: "Excel Document Name",
			filename: "report" +'.xls',
			fileext: ".xls", 
			exclude_img: true, 
			exclude_links: true,
			exclude_inputs: true 
		}); 
	}; 
	
	function ExamStudentToExcelConverter(){
		$('<table>').append(
           $("#report-table").DataTable().$('tr').clone()
        ).table2excel({
        	exclude: ".noExl"
   			, name: "Excel Document Name",
   			filename: "exam" +'.xls', 
   			fileext: ".xls", 
   			exclude_img: true, 
   			exclude_links: true,
   			exclude_inputs: true
        });
	}
	
	function AttendStudentToExcelConverter(){
		$('<table>').append(
           $("#attendance-table").DataTable().$('tr').clone()
        ).table2excel({
        	exclude: ".noExl"
   			, name: "Excel Document Name",
   			filename: "exam" +'.xls', 
   			fileext: ".xls", 
   			exclude_img: true, 
   			exclude_links: true,
   			exclude_inputs: true
        });
	}
	</script>