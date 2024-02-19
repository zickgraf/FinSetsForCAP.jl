# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Implementations
#

## Sum( (0):(n - 1), i -> q^i );
InstallMethod( @__MODULE__,  GeometricSum,
        [ IsBigInt, IsBigInt ],
  function ( q, n )
    
    if (q == 1)
        return n;
    end;
    
    return QUO_INT( q ^ n - 1, q - 1 );
    
end );

## Sum( (1):(n - 1), i -> i * q^(i-1) )
InstallMethod( @__MODULE__,  GeometricSumDiff1,
        [ IsBigInt, IsBigInt ],
  function ( q, n )

    if (n == 0)
        return BigInt( 0 );
    elseif (q == 1)
        return Binomial( n, 2 );
    end;
    
    return QUO_INT( 1 + ((n - 1) * q - n) * q ^ (n - 1), (q - 1) ^ 2 );
    
end );

## ProjectionInFactorOfDirectProduct( [ a, b ], 1 )
InstallMethod( @__MODULE__,  RemIntWithDomain,
        [ IsBigInt, IsObject, IsBigInt ],
        ## FIXME: replace IsObject -> IsBigInt
        ## The line Product( List( D[(1):(k - 1)], Length ) ) in AddProjectionInFactorOfDirectProductWithGivenDirectProduct
        ## produces during *runtime* an empty list and Product( [ ] ) in CAP.jl evaluates it to 1 and not BigInt( 1 )
        
  function ( number, a, ab )
    
    @Assert( 0, number < ab );
    
    return RemInt( number, a );
    
end );

## ProjectionInFactorOfDirectProduct( [ a, b ], 2 )
InstallMethod( @__MODULE__,  QuoIntWithDomain,
        [ IsBigInt, IsObject, IsBigInt ],
        ## FIXME: replace IsObject -> IsBigInt
        ## The line Product( List( D[(1):(k - 1)], Length ) ) in AddProjectionInFactorOfDirectProductWithGivenDirectProduct
        ## produces during *runtime* an empty list and Product( [ ] ) in CAP.jl evaluates it to 1 and not BigInt( 1 )
        
  function ( number, a, ab )
    
    @Assert( 0, number < ab );
    
    return QuoInt( number, a );
    
end );

##
InstallMethod( @__MODULE__,  DivIntWithGivenQuotient,
        [ IsBigInt, IsObject, IsBigInt ],
        ## FIXME: replace IsObject -> IsBigInt
        ## The line Product( List( D[(1):(k - 1)], Length ) ) in AddProjectionInFactorOfDirectProductWithGivenDirectProduct
        ## produces during *runtime* an empty list and Product( [ ] ) in CAP.jl evaluates it to 1 and not BigInt( 1 )
        
  function ( number, d, q )
    
    @Assert( 0, d * q == number );
    
    return q;
    
end );

## CartesianLambdaElimination
InstallMethod( @__MODULE__,  DigitInPositionalNotation,
        [ IsBigInt, IsBigInt, IsBigInt, IsBigInt ],
        
  function ( number, index, length, base )
    
    @Assert( 0, index < length );
    
    return RemInt( QuoInt( number, base ^ index ), base );
    
end );
