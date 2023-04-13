
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> I = FinSet( 0 )
|0|

julia> T = FinSet( 1 )
|1|

julia> M = FinSet( 2 )
|2|

julia> IsInjective( I )
false

julia> IsInjective( T )
true

julia> IsInjective( M )
true

julia> IsIsomorphism( MonomorphismIntoSomeInjectiveObject( I ) )
false

julia> IsMonomorphism( MonomorphismIntoSomeInjectiveObject( I ) )
true

julia> IsOne( MonomorphismIntoSomeInjectiveObject( M ) )
true

```
