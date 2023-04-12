
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> I = FinSet( [ ] )
<An object in FinSets>

julia> T = FinSet( [ 1 ] )
<An object in FinSets>

julia> M = FinSet( [ 2 ] )
<An object in FinSets>

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
