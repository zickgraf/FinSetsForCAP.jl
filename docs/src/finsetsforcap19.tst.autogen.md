
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( (1):(5) )
<An object in FinSets>

julia> N1 = FinSet( (1):(3) )
<An object in FinSets>

julia> iota1 = EmbeddingOfFinSets( N1, M )
<A morphism in FinSets>

julia> N2 = FinSet( (2):(5) )
<An object in FinSets>

julia> iota2 = EmbeddingOfFinSets( N2, M )
<A morphism in FinSets>

julia> D = [ iota1, iota2 ];

julia> int = FiberProduct( D )
<An object in FinSets>

julia> Display( int )
[ [ 2, 2 ], [ 3, 3 ] ]

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
<A morphism in FinSets>

julia> int1 = ImageObject( pi1 )
<An object in FinSets>

julia> Display( int1 )
[ 2, 3 ]

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
<A morphism in FinSets>

julia> int2 = ImageObject( pi2 )
<An object in FinSets>

julia> Display( int2 )
[ 2, 3 ]

```
