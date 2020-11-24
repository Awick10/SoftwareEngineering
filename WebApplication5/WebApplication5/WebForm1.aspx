<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="PlayerData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [PlayerId], [PlayerLast] FROM [Player]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="CoachData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CoachID], [CoachLast] FROM [Coach]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="PlayerSkill" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SkillID], [SkillDescription] FROM [SkillLevel]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="PlayerFunnel" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [FunnelID], [FunnelDescription] FROM [Funnel]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="FindPlayer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [PlayerLast], [PlayerId], [PlayerSkillID], [PlayerCoachID], [PlayerFunnelID] FROM [Player] WHERE (([PlayerCoachID] = @PlayerCoachID) AND ([PlayerFunnelID] = @PlayerFunnelID) AND ([PlayerSkillID] = @PlayerSkillID))">
            <SelectParameters>
                <asp:ControlParameter ControlID="CoachDD" Name="PlayerCoachID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="FunnelDD" Name="PlayerFunnelID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="SkillDD" Name="PlayerSkillID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="FilterData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Player] WHERE ([PlayerId] = @PlayerId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PlayerId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <strong>Pick a Recruit</strong><br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="PlayerData" DataTextField="PlayerLast" DataValueField="PlayerId">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <strong>Filter Recruits</strong><br />
        Coach<br />
        <asp:DropDownList ID="CoachDD" runat="server" DataSourceID="CoachData" DataTextField="CoachLast" DataValueField="CoachID" AppendDataBoundItems = "true">
            <asp:ListItem Text="All Recruits" Value="0"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        Skill<br />
        <asp:DropDownList ID="SkillDD" runat="server" DataSourceID="PlayerSkill" DataTextField="SkillDescription" DataValueField="SkillID">
        </asp:DropDownList>
        <br />
        <br />
        Funnel<br />
        <asp:DropDownList ID="FunnelDD" runat="server" DataSourceID="PlayerFunnel" DataTextField="FunnelDescription" DataValueField="FunnelID">
        </asp:DropDownList>
        <br />
        <br />
        Find Player<br />
        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="FindPlayer" DataTextField="PlayerLast" DataValueField="PlayerId">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Find Player" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Contact" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Academic" />
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Basketball" />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Comments" />
        <br />
        <br />
        <asp:Panel ID="ContactPanel" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PlayerId" DataSourceID="FilterData">
                <Columns>
                    <asp:BoundField DataField="PlayerId" HeaderText="PlayerId" InsertVisible="False" ReadOnly="True" SortExpression="PlayerId" />
                    <asp:BoundField DataField="PlayerFirst" HeaderText="PlayerFirst" SortExpression="PlayerFirst" />
                    <asp:BoundField DataField="PlayerLast" HeaderText="PlayerLast" SortExpression="PlayerLast" />
                    <asp:BoundField DataField="PlayerPhone" HeaderText="PlayerPhone" SortExpression="PlayerPhone" />
                    <asp:BoundField DataField="PlayerStreetAddress" HeaderText="PlayerStreetAddress" SortExpression="PlayerStreetAddress" />
                    <asp:BoundField DataField="PlayerCity" HeaderText="PlayerCity" SortExpression="PlayerCity" />
                    <asp:BoundField DataField="PlayerZipCode" HeaderText="PlayerZipCode" SortExpression="PlayerZipCode" />
                    <asp:BoundField DataField="PlayerState" HeaderText="PlayerState" SortExpression="PlayerState" />
                    <asp:BoundField DataField="PlayerEmail" HeaderText="PlayerEmail" SortExpression="PlayerEmail" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="AcademicPanel" runat="server">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="PlayerId" DataSourceID="FilterData">
                <Columns>
                    <asp:BoundField DataField="PlayerFirst" HeaderText="PlayerFirst" SortExpression="PlayerFirst" />
                    <asp:BoundField DataField="PlayerLast" HeaderText="PlayerLast" SortExpression="PlayerLast" />
                    <asp:BoundField DataField="PlayerHSGPA" HeaderText="PlayerHSGPA" SortExpression="PlayerHSGPA" />
                    <asp:BoundField DataField="PlayerHSSATACT" HeaderText="PlayerHSSATACT" SortExpression="PlayerHSSATACT" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="BasketballPanel" runat="server">
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="PlayerId" DataSourceID="FilterData">
                <Columns>
                    <asp:BoundField DataField="PlayerFirst" HeaderText="PlayerFirst" SortExpression="PlayerFirst" />
                    <asp:BoundField DataField="PlayerLast" HeaderText="PlayerLast" SortExpression="PlayerLast" />
                    <asp:BoundField DataField="PlayerStat3PtPct" HeaderText="PlayerStat3PtPct" SortExpression="PlayerStat3PtPct" />
                    <asp:BoundField DataField="PlayerStat2PtPct" HeaderText="PlayerStat2PtPct" SortExpression="PlayerStat2PtPct" />
                    <asp:BoundField DataField="PlayerStatFTPct" HeaderText="PlayerStatFTPct" SortExpression="PlayerStatFTPct" />
                    <asp:BoundField DataField="PlayerStateReb" HeaderText="PlayerStateReb" SortExpression="PlayerStateReb" />
                    <asp:BoundField DataField="PlayerStatSteals" HeaderText="PlayerStatSteals" SortExpression="PlayerStatSteals" />
                    <asp:BoundField DataField="PlayerStatAssists" HeaderText="PlayerStatAssists" SortExpression="PlayerStatAssists" />
                    <asp:BoundField DataField="PlayerStatFouls" HeaderText="PlayerStatFouls" SortExpression="PlayerStatFouls" />
                    <asp:BoundField DataField="PlayerStatus" HeaderText="PlayerStatus" SortExpression="PlayerStatus" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <asp:Panel ID="CommentsPanel" runat="server">
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="PlayerId" DataSourceID="FilterData">
                <Columns>
                    <asp:BoundField DataField="PlayerFirst" HeaderText="PlayerFirst" SortExpression="PlayerFirst" />
                    <asp:BoundField DataField="PlayerLast" HeaderText="PlayerLast" SortExpression="PlayerLast" />
                    <asp:BoundField DataField="PlayerYeartoDoane" HeaderText="PlayerYeartoDoane" SortExpression="PlayerYeartoDoane" />
                    <asp:BoundField DataField="PlayerStatus" HeaderText="PlayerStatus" SortExpression="PlayerStatus" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
