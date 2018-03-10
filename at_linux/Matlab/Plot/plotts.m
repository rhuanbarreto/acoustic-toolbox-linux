function plotts( filename )
% plot a time series from the given file

% open the file
fid = fopen( filename, 'r' );
if ( fid == -1 )
    error( 'No timeseries file with that name exists' );
end

% read

pltitl = fgetl( fid );
nrd    = fscanf( fid, '%f', 1 );
rd     = fscanf( fid, '%f', nrd );
temp   = fscanf( fid, '%f', [ nrd + 1, inf ] );
fclose( fid );

% extract rts
t   = temp( 1, : )';
nt  = length( t );
rts = temp( 2 : nrd + 1, : )';

% plot
figure
orient tall
take = 1 : nt;
title( pltitl )

% scale all time series so that max is unity
scale  = max( max( rts( take, : ) ) );
rts    = rts / scale * rd( nrd ) / nrd;
offset = linspace( rd( 1 ), rd( nrd ), nrd );

hold on
threshold = 0;

for ird = 1 : nrd
   ii = find( rts( take, ird ) >  threshold );   % above threshold
   jj = find( rts( take, ird ) <= threshold );   % below threshold
   %h = area( t( take( ii ) ), rts( take( ii ), ird ) + offset( ird ) ); % plot part above threshold with shading under line
   %ylabel( [ 'Rd = ', num2str( rd( ird ) ) ] );
   %set( h, 'BaseValue', offset( ird ) );
   %plot( t( take( ii ) ), rts( take( ii ), ird ) + offset( ird ) ); % plot part above threshold just as a line
   %plot( t( take( jj ) ), rts( take( jj ), ird ) + offset( ird ) ); % plot part below threshold just as a line
   plot( t, rts( :, ird ) + offset( ird ) ); % plot as a line
   % drawnow; pause( 2 )
end

xlabel( 'Time (s)' );
%ylabel( [ 'Rd = ', num2str( rd( nrd ) ) ] );

%set(1,'PaperPosition', [ 0.25 0.00 5.5 7.0 ] )
%print -deps bellhop.ps

%%
% shaded color plot

%figure
%imagesc( rts )
%colorbar