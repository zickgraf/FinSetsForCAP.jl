

```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> T = TerminalObject( SkeletalFinSets );

julia> M = FinSet( (0):(1) );

julia> N = FinSet( (0):(2) );

julia> K = FinSet( (0):(3) );

julia> t = TerminalObject( SkeletalFinSets );

julia> m = FinSet( 2 );

julia> n = FinSet( 3 );

julia> k = FinSet( 4 );

julia> Display( List( AsList( ProjectionInFactorOfDirectProduct( [ M, N, K ], 1 ) ), i -> i[2] ) )
[ 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 ]

julia> Display( AsList( ProjectionInFactorOfDirectProduct( [ m, n, k ], 1 ) ) )
[ 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 ]

julia> Display( List( AsList( ProjectionInFactorOfDirectProduct( [ M, N, K ], 2 ) ), i -> i[2] ) )
[ 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2 ]

julia> Display( AsList( ProjectionInFactorOfDirectProduct( [ m, n, k ], 2 ) ) )
[ 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2 ]

julia> Display( List( AsList( ProjectionInFactorOfDirectProduct( [ M, N, K ], 3 ) ), i -> i[2] ) )
[ 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3 ]

julia> Display( AsList( ProjectionInFactorOfDirectProduct( [ m, n, k ], 3 ) ) )
[ 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3 ]

julia> Ev = List( AsList( CartesianEvaluationMorphism( N, K ) ), i -> i[2] );

julia> Display( Ev )
[ 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ]

julia> ev = AsList( CartesianEvaluationMorphism( n, k ) );

julia> ev == Ev
true

julia> Coev_set = CartesianCoevaluationMorphism( M, N );; ## M, K

julia> Coev = List( AsList( Coev_set ), i -> -1 + Position( AsList( Range( Coev_set ) ), i[2] ) );

julia> Display( Coev )
[ 156, 199 ]

julia> coev = AsList( CartesianCoevaluationMorphism( m, n ) );; ## m, k

julia> Display( coev )
[ 156, 199 ]

```
