
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> T = S
<An object in FinSets>

julia> phi = [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ] ];

julia> phi = MapOfFinSets( S, phi, T )
<A morphism in FinSets>

julia> I = ImageObject( phi )
<An object in FinSets>

julia> Length( I )
3

julia> IsMonomorphism( phi )
true

julia> IsSplitMonomorphism( phi )
true

julia> IsEpimorphism( phi )
true

julia> IsSplitEpimorphism( phi )
true

julia> iota = ImageEmbedding( phi )
<A morphism in FinSets>

julia> pi = CoastrictionToImage( phi )
<A morphism in FinSets>

julia> PreCompose( pi, iota ) == phi
true

```
