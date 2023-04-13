
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( (1):(5) )
<An object in FinSets>

julia> N1 = FinSet( [ 1, 2, 4 ] )
<An object in FinSets>

julia> iota1 = EmbeddingOfFinSets( N1, M )
<A morphism in FinSets>

julia> N2 = FinSet( [ 2, 3 ] )
<An object in FinSets>

julia> iota2 = EmbeddingOfFinSets( N2, M )
<A morphism in FinSets>

julia> D = [ iota1, iota2 ];

julia> int = FiberProduct( D )
<An object in FinSets>

julia> Display( int )
[ [ 2, 2 ] ]

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
<A morphism in FinSets>

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
<A morphism in FinSets>

julia> UU = Pushout( pi1, pi2 )
<An object in FinSets>

julia> Display( UU )
[ [ [ 1, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], [ [ 1, 4 ] ], [ [ 2, 3 ] ] ]

julia> iota = UniversalMorphismFromPushout( [ pi1, pi2 ], [ iota1, iota2 ] )
<A morphism in FinSets>

julia> U = ImageObject( iota )
<An object in FinSets>

julia> Display( U )
[ 1, 2, 4, 3 ]

julia> UnionOfFinSets( FinSets, [ N1, N2 ] ) == U
true

```
