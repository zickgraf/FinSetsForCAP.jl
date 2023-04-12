
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> K = FinSet( [ 2, 3, 5 ] );

julia> Display( K )
[ 2, 3, 5 ]

julia> L = FinSet( [ 0, 1, 2, 3, 5, 6 ] );

julia> Display( L )
[ 0, 1, 2, 3, 5, 6 ]

julia> l = EmbeddingOfFinSets( K, L )
<A morphism in FinSets>

julia> G = FinSet( [ 0, 1, 2, 3, 4, 5, 6, 10 ] );

julia> Display( G )
[ 0, 1, 2, 3, 4, 5, 6, 10 ]

julia> m = EmbeddingOfFinSets( L, G )
<A morphism in FinSets>

```
