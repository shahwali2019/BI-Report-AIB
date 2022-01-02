<%@ Page Title="AIB" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BI_Report_AIB._Default" ClientIDMode="Static" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="Scripts/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
   
function fillHidTable(){
    var dt = new Date();
document.getElementById('date-time').innerHTML=dt;
    var checkBox = document.getElementById("BI24PDF");
    var text = document.getElementById("text");

    if (checkBox.checked == true) {
        text.style.display = "block";
    } else {
        text.style.display = "none";
    }

        var checkBox = document.getElementById("BI25PDF");
    var text1 = document.getElementById("text1");

    if (checkBox.checked == true) {
        text1.style.display = "block";
    } else {
        text1.style.display = "none";
    }
    var BI; //-- hidden field
    var rf; //-- retrieved field
    for ( var i = 1; i < 24; i++ ) {
        rf = "BI"+i;
        document.getElementById(rf).innerHTML = document.getElementById("BI" + i + "PDF").value;
    }
    tableToExcel('hidTable', 'Analysis Results');
	
	$('#checkboxes').on('click', ':checkbox', function(e) {
  $('#checkboxes :checkbox').each(function() {
    if (this != e.target)
      $(this).prop('checked', false);
  });
});
}
        function HideLabel1() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=txtlbl1.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
var tableToExcel = (function() {
    var uri = 'data:application/msword;base64,'
            , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" ><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta charset="UTF-8"> </head><body><table>{table}</table></body></html>'
            , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
            , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
    return function(table, name) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {worksheet: name || 'Report', table: table.innerHTML}
        window.location.href = uri + base64(format(template, ctx))
        
    }
    })()

    function HideLabel() {
        var seconds = 5;
        setTimeout(function () {
            document.getElementById("<%=txtlbl.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };


</script>

    <style type="text/css" media="screen"> .divCenMid {
    	font-family: Arial, sans-serif;
    	font-size: 14pt;
    	font-style: normal;
    	font-weight: 700;
    	text-align: center;
    	vertical-align: middle;
    	margin: 0;
    }


    .table{
    	border: .75pt solid windowtext;
    	color: #000;
    	font-family: Arial, sans-serif;
    	font-size: 8pt;
    	font-style: normal;
    	font-weight: 400;
    	text-align: center;
    	vertical-align: middle;
    	margin: 0;
    }
    .allbdrCenTop {
    	border: .75pt solid windowtext;
    	color: #000;
    	font-family: Arial, sans-serif;
    	font-size: 10pt;
    	font-style: normal;
    	font-weight: 400;
    	text-align: center;
    	vertical-align: top;
    	margin: 0;
    }
    .allbdrLtMid {
    	border: .75pt solid windowtext;
    	color: #000;
    	font-family: Arial, sans-serif;
    	font-size: 10pt;
    	font-style: normal;
    	font-weight: 400;
    	text-align: left;
    	vertical-align: middle;
    	margin: 0;
    }
    .allbdrLtTop {
    	border: .75pt solid windowtext;
    	color: #000;
    	font-family: Arial, sans-serif;
    	font-size: 10pt;
    	font-style: normal;
    	font-weight: 400;
    	text-align: left;
    	vertical-align: top;
    	margin: 0;
    }
    .auto-style1 {
    	height: 19px;
    }
    .auto-style2 {
    	height: 20px;
    }

    table td {
    	border: 1px solid green;
    }
    table td.shrink {
    	white-space: nowrap
    }
    table td.expand {
    	width: 9%
    }

thead { display: none; }

.row_heading,
.data {
  position: relative;
  padding: 0.5em;
  border: solid 0px #0000; /* border-color = transparent */
  box-shadow: inset -3px -2px 0 -1px #ccc, inset -1px 2px 0 -1px #ccc;
}
.level0,
.level0 + .level1,
.level0 + .level1 + .level2,
.level0 + .level1 + .level2 + .level3,
.level0 + .level1 + .level2 + .level3 + .data {
  border-top-width: 2em; /* Gap for ID */
}
.level1,
.level1 + .level2,
.level1 + .level2 + .level3,
.level1 + .level2 + .level3 + .data {
  border-top-width: 1em; /* Gap for Machine */
}
.level2,
.level2 + .level3,
.level2 + .level3 + .data {
  border-top-width: 0.5em; /* Gap for Component */
}

tr:first-child th,
tr:first-child td {
  border-top-width: 0px !important; /* No gap for first (top) section */
}

img{display: block; margin-left: 40%; margin-right: 30%;}
    </style>


<table width="565px" style="border-spacing:0;   margin-left: auto; margin-right: auto;" id="QMSTable" >
	<tr>
		<td class="divCenMid" colspan="4">AIB FT Form</td>
		<img src="htm1.png" alt="" width="348" height="51" align="center" style="margin-left: 410px;" />
            <div style="text-align:right; margin-bottom: -3px; text-align: center">
                  <asp:Label ID="txtlbl" ForeColor="Red" Font-Bold="true" Text="There is No Data In The FlexCube." runat="server" Visible="false" />
            </div>
            <div style="text-align:right; margin-bottom: -3px; text-align: center">
                <asp:Label ID="txtlbl1" ForeColor="Red" Font-Bold="true" Text="Data Found In The FlexCube." runat="server" Visible="false" />
            </div>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">International</td>
		<td class="">
			<input id="BI24PDF" type="checkbox" value="0" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI24PDF" />
		</td>
	</tr>
    	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Domestic</td>
		<td class="">
			<input id="BI25PDF" type="checkbox" class="nobdrCenMid" style="overflow:hidden; width:120% " value="1" name="BI25PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Amount</td>
		<td class="">
			<input id="BI1PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI1PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Currency</td>
		<td class="">
			<%--<input id="BI2PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI2PDF" />--%>
            <asp:TextBox ID="BI2PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI2PDF" runat="server"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Amount in Words</td>
		<td class="">
			<input id="BI3PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI3PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Value Data</td>
		<td class="">
			<input id="BI4PDF" type="date" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI4PDF" />
		</td>
	</tr>
<%--	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Sender Occupation</td>
		<td class="">
			<input id="BI5PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI5PDF" />
		</td>
	</tr>--%>
    <!--
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary Name</td>
		<td class="">
			<input id="BI6PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI6PDF" />
		</td>
	</tr>
    -->
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary Street Address</td>
		<td class="">
			<input id="BI7PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI7PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary City</td>
		<td class="">
			<input id="BI8PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI8PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary date of birth</td>
		<td class="">
			<input id="BI9PDF" type="date" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI9PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Date of Birth</td>
		<td class="">
			<%--<input id="BI10PDF" type="date" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI10PDF" />--%>
            <asp:TextBox ID="BI10PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI10PDF" runat="server"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Place of Birth</td>
		<td class="">
			<%--<input id="BI11PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI11PDF" />--%>
            <asp:TextBox ID="BI11PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI11PDF" runat="server"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary Nationality</td>
		<td class="">
			<%--<input id="BI12PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI12PDF" />--%>
            <asp:TextBox ID="BI12PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI12PDF" runat="server"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Transfer Details</td>
		<td class="">
			<input id="BI13PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI13PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary Bank Name</td>
		<td class="">
			<input id="BI14PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI14PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary Bank Address</td>
		<td class="">
			<input id="BI15PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI15PDF" />
		</td>
	</tr>
    <!--
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary Bank IBAN/Routing code</td>
		<td class="">
			<input id="BI16PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI16PDF" />
		</td>
	</tr>
    -->
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Interm, Bank Name</td>
		<td class="">
			<input id="BI17PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI17PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Interm, Account Number</td>
		<td class="">
			<input id="BI18PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI18PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Interm, Bank IBAN</td>
		<td class="">
			<input id="BI19PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI19PDF" />
		</td>
	</tr>
    <!--
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Interm, SWIFT CODE</td>
		<td class="">
			<input id="BI20PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI20PDF" />
		</td>
	</tr>
    -->
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Occupation</td>
		<td class="" style="width: 50%">
<%--			<input id="BI21PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI21PDF" />--%>
            <asp:TextBox ID="BI21PDF" runat="server" name="BI21PDF"  style="overflow:hidden; width:120%" class="nobdrCenMid" ClientIDMode="Static" ></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">

            <asp:Button ID="Button1" runat="server" Text="Search Account" onclick="Button1_Click"  class="btn btn-success"  />&nbsp;&nbsp;&nbsp; <b>Payer Account</b>
           </td>
        
		<td class="">

			<%--<input id="BI22PDF" maxlength="16" type="text"  class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI22PDF" /> --%>
            <asp:TextBox ID="BI22PDF" runat="server" maxlength="16" class="nobdrCenMid" placeholder="Enter the account no." style="overflow:hidden; width:120%" name="BI22PDF"></asp:TextBox>

        </td>

	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Country</td>
		<td class="">
			<input id="BI23PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI23PDF" />
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary Account</td>
		<td class="">
			<input id="BI16PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI16PDF" />
		</td>
	</tr>
    <!--
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Payment Code</td>
		<td class="">
			<input id="BI25PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI25PDF" />
		</td>
	</tr>
    -->
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Beneficiary bank SWIFT</td>
		<td class="">
			<input id="BI20PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI20PDF" />
		</td>
	</tr>
    <!--
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Interm, bank Code</td>
		<td class="">
			<input id="BI16PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI16PDF" />
		</td>
	</tr>
    -->
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Account Number</td>
		<td class="">
			<%--<input id="BI6PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI6PDF" />--%>
            <asp:TextBox ID="BI6PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI6PDF" runat="server"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td class="allbdrCenTop" style="width:50%; text-align: left">Customer</td>
		<td class="">
<%--			<input id="BI5PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI5PDF" />--%>
            <asp:TextBox ID="BI5PDF" type="text" value="" class="nobdrCenMid" style="overflow:hidden; width:120% " name="BI5PDF" runat="server"></asp:TextBox>
		</td>
	</tr>
</table>
    
<div id="hidTable" style="display: none; font-size: 8px;">
        <div style="text-align: center;">
            <img src="data:image/png;base64,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" alt="htm1.png" style="max-width:100%;">
	<p style="font-size: 8px; background-color:goldenrod; margin-bottom: -30px;">Fund Transfer Application Form</p>
        </div>
<table id="testTable" border="1" class="table table-striped" style="font-size: 8px;margin-bottom: -14px;">

	<tr>
		<td></td>
		<td style="padding-left: 100px" class="auto-style2">Sender information</td>
		<td style="padding-left: 50px" class="auto-style2">Transfer Type</td>
	</tr>
	<tr>
		<td class="auto-style1" width="20%">Customer:</td>
		<td id="BI5" class="auto-style1" width="25%"></td>
		<td class="auto-style1" style="padding-left: 25px; display:none" width="25%" id="text">International</td>
	</tr>
	<tr>
		<td width="20%">Account No:</td>
		<td id="BI6" width="25%"></td>
		<td class="auto-style1" style="padding-left: 10px" width="25%" id="text1">Domestic</td>
	</tr>
</table>

<table border="1" class="table table-striped" style="font-size: 8px">
	<tbody>
		<tr>
			<td rowspan="2">For Individuals only:</td>
			<td width="15%">Date of Birth</td>
			<td width="15%">Place of Birth</td>
			<td width="15%">Nationality</td>
			<td colspan="2" width="15%">Occupation</td>
		</tr>
		<tr>
			<td id="BI10" width="15%"></td>
			<td id="BI11" width="15%"></td>
			<td id="BI12" width="15%"></td>
			<td id="BI21" colspan="2" width="15%"></td>
		</tr>
		<tr>
			<td rowspan="2" style="vertical-align: middle;">Instraction transfer:</td>

			<td width="15%">Amount(in figures)</td>
			<td id="BI1" width="15%"></td>
			<td width="15%">Currency</td>
			<td id="BI2" width="15%"></td>
			<td width="15%">Country</td>
			<td id="BI23" width="15%"></td>
		</tr>

		<tr>
			<td width="15%">Amount (in words)</td>
			<td id="BI3" colspan="3" width="15%"></td>
			<td width="15%">Value Date</td>
			<td id="BI4" width="15%"></td>
		</tr>
                <tr>
                <td rowspan="8" style="vertical-align: middle;">Beneficiary details</td>

        </tr>
        <tr>

			<td width="20%">Payer Account:</td>
			<td id="BI22" width="25%" colspan="5"></td>
		</tr>
		<tr>
			<td width="20%">Account Number:</td>
			<td id="BI16" width="25%" width="50%" colspan="5"></td>
		</tr>
		<tr>
			<td rowspan="2">Beneficiary Address</td>
			<td width="33.33%">Street Address</td>
			<td width="33.33%">City</td>
			<td colspan="2" width="33.33%">Country</td>
		</tr>

<tr>
	<td id="BI7" width="33.33%"></td>
	<td id="BI8" width="33.33%"></td>
	<td id="" colspan="2" width="33.33%"></td>
</tr>
<tr>
	<td rowspan="2">For Individuals Only</td>
	<td width="30%">Date of Birth</td>
	<td width="30%">Place of Birth</td>
	<td colspan="2" width="40%">Nationality</td>
</tr>
<tr>
	<td id="BI9" width="30%"></td>
	<td id="BI11" width="30%"></td>
	<td id="BI12"  colspan="2" width="40%"></td>
</tr>
<tr>
	<td>Details of transfer</td>
	<td width="100%" colspan="3" id="BI13"></td>
</tr>
<tr>
	<td rowspan=3 style="vertical-align : middle;text-align:center;">Intermediary Bank Details (if any)</td>
	<td class="">Bank Name</td>
	<td id="BI17" width="100%" colspan="3"></td>
</tr>

<tr>
	<td>Account #</td>
	<td id="BI18" width="100%" colspan="3"></td>
</tr>
<tr>
	<td>IBAN / Routing # SWIFT</td>
	<td id="BI19" width="100%" colspan="3"></td>
</tr>
<tr>
	<td class="" rowspan=4 style="vertical-align : middle;text-align:center;">Beneficairy Bank Details</td>
	<td class="">Name</td>
	<td id=""></td>
</tr>
    <tr>
	<td>Address</td>
	<td id="" width="100%" colspan="3"></td>
</tr>
<tr>
	<td>IBAN / Routing #</td>
	<td id="BI15" width="100%" colspan="3"></td>
</tr>
<tr>
	<td>SWIFT</td>
	<td id="BI20" width="100%" colspan="3"></td>
</tr>
         </tbody>
</table>
<table border="1" class="table table-responsive" style="font-size: 8px">
	<tbody>
		<tr>
			<td class="" rowspan=3 style="vertical-align : middle;text-align:center; width: 40px">External Payment Code</td>
			<td class="" style="width: 20%">Single purpose</td>
			<td style="width: 7%" id=""></td>
			<td style="width: 7%" id=""></td>
			<td style="width: 7%" id=""></td>
			<th style="width: 7%">OUR</th>
			<td style="width: 50%" id="">
				<p>AIB Charges, Intermediary, & Beneficiary Bank charges to my account</p>
			</td>
		</tr>
		<tr>
			<td rowspan=2>Multiple Purpose</td>
			<td style="width: 7%" id="">A</td>
			<td style="width: 7%" id=""></td>
			<td style="width: 7%" id=""></td>
			<th style="width: 7%">BEN</th>
			<td style="width: 50%" id="">
				<p>AIB Charges, Intermediary, & Beneficiary Bank charges to my account</p>
			</td>
		</tr>
		<tr>
			<td style="width: 7%">B</td>
			<td style="width: 7%" id=""></td>
			<td style="width: 7%" id=""></td>
			<th style="width: 7%">SHA</th>
			<td id="" style="width: 50%">
				<p>AIB Charges, Intermediary, & Beneficiary Bank charges to my account</p>
			</td>
		</tr>
	</tbody>
</table>
<table>
	<tbody>
		<tr>
			<td>
				<p style="font-size: 9px; border-style: dotted; border-width: 1px">AIB shall not be held liable if the beneficiary does not receive the transferred amount on any reasons stated by the intermediary or beneficiary bank due to blockage or stoppage of the transfer process, or for any deley in the payment of the amount.</p>
			</td>
		</tr>
		<tr>
			<td>
				<p style="font-size: 9px; border-style: dotted; border-width: 1px">هرگاه پول انتقال داده شده از بانک بین المللی افغانستان. قبل از رسیدن به حساب بانکی شخص دریافت کننده بنا بر دلایلی از طرف بانک میانجی و یا بانک ذینفع بلاک گردد، یا انتقال آن متوقف گردد و یا هم در تادیه آن تاخیر صورت گیرد، بانک بین المللی افغانستان در ضمینه هیچ نوع مسئولیتی نخواهد داشت.</p>
			</td>
		</tr>
		<tr>
			<td>
				<p style="font-size: 9px; border-style: dotted; border-width: 1px">


                    د افغانستان نړیوال بانک اداره     د پیسو د لیږد په پروسه کي کله چي د پیسي لاسته راوړونکي بانک ته په هر ډول لامل لکه د پیسو کنګل کیدلو، درولو او یا د لیږد په پروسه کي د بل هر ډول ځند په سبب لیږدیدلي پیسي د منځګړی بانک یا پیسي لاسته راوړونکي بانک ته و نه رسیږي، هیڅ ډول مسؤولیت او پړه په غاړه نلري.


                    </p>
		</tr>
		<tr>
			<td>
				<p style="font-size: 8px; border-style: dotted; border-width: 1px">.</p>
			</td>
		</tr>
		<tr>
			<td>
				<p style="font-size: 8px; border-style: dotted; border-width: 1px">I/We authorize the Bank to debit our account with above mentioned amount and associated charges. I/We also certify that the above mentioned information is accurate and complete to the best of my knowledge. the above mentioned information is accurate and complete to the best of my knowledge. On a later date if AIB requires any documentary proof of purpose, I/we undertake to submit the same.</p>
			</td>
		</tr>
		<tr>
			<td style="font-size: 10px">Sender's Signature: ------------------------------------------------DATE: <span id='date-time'></span></td>
		</tr>
	</tbody>
</table>
<p style="font-size: 8px; border: 1px solid black; text-align: center; width: 100%">For Bank Use Only</p>
<table style="font-size: 8px;" border="1">
	<tr>
		<td>Signature Verified:
			<input type="checkbox" />
		</td>
		<td>Checked by:</td>
		<td style="width: 10%" id=""></td>
		<td colspan=2>For Use by Payment Department</td>
	</tr>
	<tr>
		<td style="min-width:60px">Check against list of Sanctioned Countries:
			<input type="checkbox" />
		</td>
		<td rowspan="4">Signature:</td>
		<td id="" rowspan="4"></td>
		<td>PS Booker:</td>
		<td id="" style="width: 50%"></td>
	</tr>
	<tr>
		<td style="min-width:60px" rowspan="4">Balance Verfied:
			<input type="checkbox" />
		</td>
		<td style="min-width:60px">PS Authorizer:</td>
		<td id="" style="min-width:60px"></td>
	</tr>
	<tr>
		<td>Plexcube Ref #::</td>
		<td id="" style="min-width:60px"></td>
	</tr>
	<tr>
		<td>External Ref #::</td>
		<td id="" style="min-width:60px"></td>
	</tr>

		<tr>
            <td>Beneficiary Bank Name</td>
            <td id="BI14">-</td>
        </tr>

</table>
</div>
    <br />
<button type="button" onclick="fillHidTable()" style="margin-left: 460px; width: 300px; background-color:#1d3c7f; color: snow"> Generate report</button>


</asp:Content>
