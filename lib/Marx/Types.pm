package Marx::Types;
use strict;
use warnings;
use experimental qw(signatures);
use Mojo::Collection qw(c);
use Mojo::Util;

my @declares = (
    [qw(Acumulacao Accumulation)],
    [qw(Capital)],
    [qw(CapitalComercial ComercialCapital)],
    [qw(CapitalDeEmprestimo LoanCapital)],
    [qw(Demanda Demand)],
    [qw(Dinheiro Money)],
    [qw(ForcaDeProducao ProductiveForce)],
    [qw(ForcaDeTrabalho LabourForce)],
    [qw(Mercadoria Commodity)],
    [qw(ModoDeProducao ProductionMode)],
    [qw(Oferta Offer)],
    [qw(ProcessoDeCirculacao CirculationProcess)],
    [qw(ProdutorPrivado PrivateProducer)],
    [qw(Salario Wage)],
    [qw(Sociedade Society)],
    [qw(Tempo Time)],
    [qw(TempoDeTrabalho WorkTime)],
    [qw(Trabalho Labour)],
    [qw(TrabalhoAbstrato AbstractWork)],
    [qw(Troca Exchange)],
    [qw(TrocaMercantil MercantilExchange)],
    [qw(ValorDeUso UseValue)],
);

use Type::Library
    -utils,
    -extends => [qw(Types::Standard Types::TypeTiny)],
    -declare => c(@declares)->flatten->to_array->@*,
;

for my $types (@declares) {
    my $class = to_module($types->[-1]);
    class_type $_, { class => $class } for @$types;
}

sub to_module($type) {
    return $type =~ s/([a-z])([A-Z])/$1::$2/r;
}

1;
