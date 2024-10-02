% Automatically generated script to launch FPGA Data Capture App
% Instantiate FPGA Data Capture System object
if ~exist('fpgadc_obj','var') || ~isa(fpgadc_obj,'FPGADataCapture') || ~isprop(fpgadc_obj,'TimeStamp') || ~strcmpi(fpgadc_obj.TimeStamp,'01-Oct-2024 08:32:25')
    fpgadc_obj = FPGADataCapture;
end
fpgadc_obj.launchApp;
