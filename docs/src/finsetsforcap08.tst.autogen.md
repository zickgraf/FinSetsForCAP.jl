
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> L = FinSet( 0 )
|0|

julia> M = FinSet( 2 )
|2|

julia> Display( ExactCoverWithGlobalElements( L ) )
[  ]

julia> g = ExactCoverWithGlobalElements( M );

julia> Display( g )
[ [ 0 ] ⱶ[ 0 ]→ [ 0, 1 ], [ 0 ] ⱶ[ 1 ]→ [ 0, 1 ] ]

julia> IsOne( UniversalMorphismFromCoproduct( g ) )
true

```
