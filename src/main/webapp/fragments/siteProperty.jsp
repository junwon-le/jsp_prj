<%@page import="siteproperty.SiteProperty"%>
<%@page import="siteproperty.SitePropertyVO"%>
<%@ page language="java" 
    pageEncoding="UTF-8"%>

<%
SitePropertyVO spVO= SiteProperty.spVO;

application.setAttribute("SiteProperty", spVO);                                                          
application.setAttribute("CommonURL", spVO.getProtocol()+spVO.getServer_name()+spVO.getContext_root());
%> 