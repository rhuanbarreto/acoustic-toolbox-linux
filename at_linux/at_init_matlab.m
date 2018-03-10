% -------------------------------------------------
%   at_init_matlab
%
%   must be run FIRST to initialize paths for
%     running AT Matlab routines
% ------------------------------------------------

% This is your Home where all at routines are located
Home = pwd;

addpath([Home '/bin']);             % AT binaries

Matdir = [Home '/Matlab'];          % AT Matlab routines
addpath(Matdir);

% addpath for all extra folders/routines in Matlab
files = dir(Matdir);

for j=3:length(files)                   % skip . and ..
   if (files(j).isdir)
       addpath([Matdir files(j).name]);
   end
end

