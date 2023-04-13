
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 3 )
|3|

julia> n = FinSet( 5 )
|5|

julia> p = FinSet( 7 )
|7|

julia> psi = MapOfFinSets( m, [ 0, 2, 4 ], n )
|3| → |5|

julia> IsEpimorphism( psi )
false

julia> IsSplitEpimorphism( psi )
false

julia> IsMonomorphism( psi )
true

julia> IsSplitMonomorphism( psi )
true

julia> psi
|3| ↪ |5|

julia> psi = MapOfFinSets( p, [ 0, 2, 1, 2, 2, 1, 0 ], m )
|7| → |3|

julia> IsEpimorphism( psi )
true

julia> IsSplitEpimorphism( psi )
true

julia> IsMonomorphism( psi )
false

julia> IsSplitMonomorphism( psi )
false

julia> psi
|7| ↠ |3|

julia> id = IdentityMorphism( m )
|3| → |3|

julia> IsIsomorphism( id )
true

julia> id
|3| ⭇ |3|

```
