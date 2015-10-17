function fvec = p18_fvec ( n, x )

%*****************************************************************************80
%
%% P18_FVEC is an auxilliary routine for problem 18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 March 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real FVEC(N), an auxilliary vector.
%
  fvec = zeros ( n, 1 );

  for j = 1 : n
    t1 = 1.0;
    t2 = 2.0 * x(j) - 1.0;
    t = 2.0 * t2;
    for i = 1 : n
      fvec(i) = fvec(i) + t2;
      th = t * t2 - t1;
      t1 = t2;
      t2 = th;
    end
  end

  for i = 1 : n
    fvec(i) = fvec(i) / n;
    if ( mod ( i, 2 ) == 0 )
      fvec(i) = fvec(i) + 1.0 / ( i^2 - 1.0 );
    end
  end

  return
end
