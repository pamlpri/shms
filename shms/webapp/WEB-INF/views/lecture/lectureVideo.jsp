<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 14.      박초원        최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>${week.diary_title} 강의영상</title>
  <link rel="stylesheet" href="${cPath }/resources/lecture/dist/css/components.css">
</head>
<div class="video-wrap">
    <iframe id="video" width="100%" height="100vh" src="${week.ut_lec_link}" frameborder="0" allow="encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>