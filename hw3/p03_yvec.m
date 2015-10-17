function y = p03_yvec ( )

%*****************************************************************************80
%
%% P03_YVEC is an auxilliary routine for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real Y(15), data values needed for the
%    objective function.
%
  y = [ 0.0009, 0.0044, 0.0175, 0.0540, 0.1295, ...
        0.2420, 0.3521, 0.3989, 0.3521, 0.2420, ...
        0.1295, 0.0540, 0.0175, 0.0044, 0.0009 ]';

  return
end
