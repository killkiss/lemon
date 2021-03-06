<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "group");%>
<%pageContext.setAttribute("currentMenu", "group");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="org.org.input.title" text="编辑用户"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#orgForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });


    var options = {
		source: function(query, process) {
			$.getJSON('${scopePrefix}/rs/user/search', {
				username: query
			}, function(result) {
				process(result);
			})
		},
		items: 5
	};

	var callback = function(event, data, formatted) {
		console.info(event, data, formatted);
	};

    $("#group-base_username").typeahead(options);
})
    </script>
  </head>

  <body>
    <%@include file="/header/group.jsp"%>

    <div class="row-fluid">
	<%@include file="/menu/group.jsp"%>

	<!-- start of main -->
    <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title">添加用户</h4>
		</header>

		<div class="content content-inner">

<form id="orgForm" method="post" action="group-base!saveUser.do?operationMode=STORE" class="form-horizontal">
  <input id="group-base_groupBaseId" type="hidden" name="groupBaseId" value="${param.groupBaseId}">
  <div class="control-group">
    <label class="control-label" for="org_orgname"><spring:message code="org.org.input.orgname" text="名称"/></label>
	<div class="controls">
	  <input id="group-base_username" type="text" name="username" value="" size="40" class="text required" minlength="2" maxlength="50" autocomplete="off">
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button id="submitButton" class="btn"><spring:message code='core.input.save' text='保存'/></button>
      <button type="button" onclick="history.back();" class="btn"><spring:message code='core.input.back' text='返回'/></button>
    </div>
  </div>
</form>

        </div>
      </article>

      <div class="m-spacer"></div>

    </section>
	<!-- end of main -->
	</div>

  </body>

</html>
