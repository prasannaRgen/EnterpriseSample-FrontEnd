<%@ Page Title="" Language="C#" MasterPageFile="~/TTSHMasterPage/TTSH.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">


        $(function () {

            var HidId = $('[id*=HidId]');

            $('.dashboard-items ul>li').each(function (index, item) {
                $(item).find('a').removeClass('active')
            });
            $('#' + $(HidId).val() + '').find('a').addClass('active')
            $('[id*=h2]').text($('#' + $(HidId).val() + '').find('a').text());
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(call)
            $('body div').find('[id$=ctl00_MainContent_ReportViewerSSRS_AsyncWait_Wait]').removeAttr('style');
            $('body div').find('[id$=ctl00_MainContent_ReportViewerSSRS_AsyncWait_Wait]').hide();

            $('body div').find('[id$=ctl00_MainContent_ReportViewerSSRS_AsyncWait_Wait]').find('table').hide();

        });


        function call() {
            var HidId = $('[id*=HidId]');

            $('.dashboard-items ul>li').each(function (index, item) {
                $(item).find('a').removeClass('active')
            });
            $('#' + $(HidId).val() + '').find('a').addClass('active')
            $('[id*=h2]').text($('#' + $(HidId).val() + '').find('a').text());
            $('body div').find('[id$=ctl00_MainContent_ReportViewerSSRS_AsyncWait_Wait]').removeAttr('style');
            $('body div').find('[id$=ctl00_MainContent_ReportViewerSSRS_AsyncWait_Wait]').hide();

            $('body div').find('[id$=ctl00_MainContent_ReportViewerSSRS_AsyncWait_Wait]').find('table').hide();
            var waitMsg = $("div[id$='AsyncWait_Wait']");
            waitMsg.wrap("<div style='display:none; visibility: hidden'></div>");
        }

        function DivClicked(inputOb) {
            $('.dashboard-items ul>li').each(function (index, item) {
                $(item).find('a').removeClass('active')
            });
            $(inputOb).addClass('active');
       
            $get('<%=HidId.ClientID%>').value = inputOb.id;
            var btnHidden = $('#<%= btnHidden.ClientID %>');
            if (btnHidden != null) {
                btnHidden.click();
            }
        }
        function setSelected() {

            var SelDiv = $('[id*=HidId]').val();//  $get('<%=HidId.ClientID%>').value;
            //$('#' + SelDiv).addClass('SelBlue');
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>


            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Dashboard<span><p>Your personal manager</p>
                        </span></h1>
                        <h3>To gauge exactly how well an organization is performing overall, digital dashboards allow you to capture and report specific data points from each department within the organization, thus providing a "snapshot" of performance. </h3>
                    </div>
                </div>



                <div class="row">
                    <input type="hidden" id="HidId" runat="server" />
                    <p></p>
                    <div class="col-md-4">
                        <div class="dashboard-items" style="min-height: 400px">
                            <ul>
                                <li id="Rpt_PM" onclick="javascript:DivClicked(this);"><a href="#">Project Monitoring <span></span></a></li>
                                <li id="Rpt_CM" onclick="javascript:DivClicked(this);"><a href="#">Contract Management<span></span></a></li>
                                <li id="Rpt_RM" onclick="javascript:DivClicked(this);"><a href="#">Regulatory Monitoring<span></span></a></li>
                                <li id="Rpt_GM" onclick="javascript:DivClicked(this);"><a href="#">Grant Management<span></span></a></li>
                            
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <h2 id="h2"></h2>
                        <div class="dashboard-item">
                            <!-- open area for data/details -->
                           <%-- <rsweb:reportviewer id="ReportViewerSSRSDemo" runat="server" showtoolbar="False" width="100%"></rsweb:reportviewer>--%>

                        </div>
                    </div>
                    <asp:Button runat="server" ID="btnHidden" Style="display: none" OnClick="btnHidden_OnClick" />
                </div>

            </div>



        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

