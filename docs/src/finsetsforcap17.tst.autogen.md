
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> T = FinSet( [ "a", "b", "c" ] )
<An object in FinSets>

julia> phi = [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];

julia> phi = MapOfFinSets( S, phi, T )
<A morphism in FinSets>

julia> I = CoimageObject( phi )
<An object in FinSets>

julia> Length( I )
2

julia> IsMonomorphism( phi )
false

julia> IsSplitMonomorphism( phi )
false

julia> IsEpimorphism( phi )
false

julia> IsSplitEpimorphism( phi )
false

julia> iota = AstrictionToCoimage( phi )
<A morphism in FinSets>

julia> pi = CoimageProjection( phi )
<A morphism in FinSets>

julia> PreCompose( pi, iota ) == phi
true

```
