
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> L = FinSet( 0 )
|0|

julia> M = FinSet( 2 )
|2|

julia> N = FinSet( 3 )
|3|

julia> Display( MorphismsOfExternalHom( L, L ) )
[ ∅ ⱶ[ ]→ ∅ ]

julia> Display( MorphismsOfExternalHom( M, L ) )
[  ]

julia> Display( MorphismsOfExternalHom( L, M ) )
[ ∅ ⱶ[ ]→ [ 0, 1 ] ]

julia> Display( MorphismsOfExternalHom( M, N ) )
[ [ 0, 1 ] ⱶ[ 0, 0 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 1, 0 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 2, 0 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 1, 1 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 2, 1 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 0, 2 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 1, 2 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 2, 2 ]→ [ 0, 1, 2 ] ]

```
