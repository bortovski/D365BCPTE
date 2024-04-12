// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50000 CustomerListExt extends "Customer List"
{
    layout
    {
        modify("Allow Multiple Posting Groups")
        {
            AboutText = 'False';
        }
    }
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}
codeunit 50000 ReportMngt
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, OnAfterSubstituteReport, '', false, false)]
    local procedure OnAfterSubstituteReport(var NewReportId: Integer; ReportId: Integer)
    begin
        if ReportId = Report::"Exch. Rate Adjustment" then
            NewReportId := Report::"Adjust Exchange Rates";
    end;
}
reportextension 50000 TestReport extends "Exch. Rate Adjustment"
{

    dataset
    {
        // Add changes to dataitems and columns here
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';

        }
    }
}