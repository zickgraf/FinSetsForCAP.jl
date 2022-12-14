# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

## Sum( (0):(n - 1), i -> q^i );
InstallMethod( @__MODULE__,  GeometricSum,
        [ IsInt, IsInt ],
  function ( q, n )
    
    if q == 1
        return n;
    end;
    
    return QUO_INT( q ^ n - 1, q - 1 );
    
end );

## Sum( (1):(n - 1), i -> i * q^(i-1) )
InstallMethod( @__MODULE__,  GeometricSumDiff1,
        [ IsInt, IsInt ],
  function ( q, n )

    if n == 0
        return 0;
    elseif q == 1
        return Binomial( n, 2 );
    end;
    
    return QUO_INT( 1 + ((n - 1) * q - n) * q ^ (n - 1), (q - 1) ^ 2 );
    
end );
