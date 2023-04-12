
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> T = TerminalObject( SkeletalFinSets );

julia> M = FinSet( 4 );

julia> N = FinSet( 3 );

julia> P = FinSet( 4 );

julia> G_f = [ 0, 1, 0, 2 ];

julia> f = MapOfFinSets( M, G_f, N );

julia> IsWellDefined( f )
true

julia> G_g = [ 2, 2, 1, 0 ];

julia> g = MapOfFinSets( M, G_g, N );

julia> IsWellDefined( g )
true

julia> DirectProduct( M, N );

julia> DirectProductOnMorphisms( f, g );

julia> CartesianAssociatorLeftToRight( M, N, P );

julia> CartesianAssociatorRightToLeft( M, N, P );

julia> TerminalObject( FinSets );

julia> CartesianLeftUnitor( M );

julia> CartesianLeftUnitorInverse( M );

julia> CartesianRightUnitor( M );

julia> CartesianRightUnitorInverse( M );

julia> CartesianBraiding( M, N );

julia> CartesianBraidingInverse( M, N );

julia> ExponentialOnObjects( M, N );

julia> ExponentialOnMorphisms( f, g );

julia> CartesianEvaluationMorphism( M, N );

julia> CartesianCoevaluationMorphism( M, N );

julia> CartesianCoevaluationMorphism( T, T );

julia> DirectProductToExponentialAdjunctionMap( M, N,
            UniversalMorphismIntoTerminalObject( DirectProduct( M, N ) )
        );

julia> ExponentialToDirectProductAdjunctionMap( M, N,
            UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
        );

julia> M = FinSet( 2 );

julia> N = FinSet( 2 );

julia> P = FinSet( 1 );

julia> Q = FinSet( 2 );

julia> CartesianPreComposeMorphism( M, N, P );

julia> CartesianPostComposeMorphism( M, N, P );

julia> DirectProductExponentialCompatibilityMorphism( [ M, N, P, Q ] );

```
