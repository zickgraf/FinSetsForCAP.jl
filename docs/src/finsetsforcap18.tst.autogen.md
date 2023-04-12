
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> S = FinSet( (1):(5) )
<An object in FinSets>

julia> T = FinSet( (1):(3) )
<An object in FinSets>

julia> f1 = MapOfFinSets( S, [ [1,3],[2,3],[3,1],[4,2],[5,2] ], T )
<A morphism in FinSets>

julia> f2 = MapOfFinSets( S, [ [1,3],[2,2],[3,3],[4,1],[5,2] ], T )
<A morphism in FinSets>

julia> f3 = MapOfFinSets( S, [ [1,3],[2,1],[3,2],[4,1],[5,2] ], T )
<A morphism in FinSets>

julia> D = [ f1, f2, f3 ];

julia> Eq = Equalizer( D )
<An object in FinSets>

julia> Display( Eq )
[ 1, 5 ]

julia> iota = EmbeddingOfEqualizer( D );

julia> IsWellDefined( iota )
true

julia> Im = ImageObject( iota )
<An object in FinSets>

julia> Display( Im )
[ 1, 5 ]

julia> mu = MorphismFromEqualizerToSink( D );

julia> PreCompose( iota, f1 ) == mu
true

julia> M = FinSet( [ "a" ] );

julia> phi = MapOfFinSets( M, [ [ "a", 5 ] ], S );

julia> IsWellDefined( phi )
true

julia> psi = UniversalMorphismIntoEqualizer( D, phi )
<A morphism in FinSets>

julia> IsWellDefined( psi )
true

julia> Display( psi )
[ [ "a" ], [ [ "a", 5 ] ], [ 1, 5 ] ]

julia> PreCompose( psi, iota ) == phi
true

```
