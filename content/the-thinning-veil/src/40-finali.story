// I finali. Il narratore è il vincitore, nel 1923, in risposta al dottor Halász.

:: FinaleSquarciato [ending]
  # **Il Velo Squarciato**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} al dott. Halász – *1923.***
  > Egregio dottore, mi chiede che cosa accadde la notte del 31 dicembre 1905. Glielo dirò, anche se non mi crederà, e anche se le basterebbe uscire dalla sacrestia e fare due passi in piazza per vederlo con i suoi occhi.

  > Votammo di aprire. Il Telegrafo, o la medium, o le nostre mani intrecciate (non so più quale fosse la chiave) girarono nella serratura, e il velo si squarciò come una tenda vecchia. Non ci fu un lampo, né un tuono. Solo un gran freddo, e poi la porta della sala che si apriva da sola, e la gente che entrava. Gente che conoscevamo. Gente che avevamo seppellito.

  > Sono rimasti. A {$townname} i morti camminano con i vivi, siedono alle loro tavole, votano al consiglio, si lamentano del prezzo del pane. All'inizio si distinguevano: erano più pallidi, più silenziosi, e non facevano ombra. Adesso non è più così semplice.

  > Lei mi chiede da quale parte del velo le scrivo. Onestamente, dottore, da qualche anno ho smesso di chiedermelo.
  > Il primo a entrare, quella notte, fu un uomo anziano con un quaderno sotto il braccio e una matita consumata fino al legno. Non salutò nessuno. Andò dritto al tavolo centrale, si sedette nella sedia vuota e cominciò a scrivere, come chi riprende un lavoro interrotto. Dietro di lui veniva una lunga fila di gente che conoscevamo dai ritratti di famiglia.
  if $peti != "":
    > Il bambino dello stagno gioca ancora in piazza con i figli dei vivi. Ha otto anni da settant'anni, e non perde mai a nascondino.
  include Epilogo
  ! FINE?

:: FinaleSilenzio [ending]
  # **Il Grande Silenzio**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} al dott. Halász – *1923.***
  > Egregio dottore, il Telegrafo era finito. Bastava girare una manopola per sentire la voce del padre; bastava girarla nel verso opposto per chiudere la porta per sempre. Votammo di chiuderla.

  > La macchina urlò per un'ora, poi tacque. Da quella notte nessuna seduta ha più funzionato: non a {$townname}, non a Vienna, non a Londra. I tavolini restano a terra, le medium si sono date al teatro, e la sua Società studia il nulla con grande rigore. Me ne scuso.

  > Anche la voce del padre è rimasta dall'altra parte. Non sapremo mai che cosa volesse dirci. A volte, la notte, appoggio la mano sulla parete della mia camera, quella dove una volta bussavano, e aspetto. La parete è fredda, e muta, e io dormo benissimo.

  > È questo che non mi perdono.
  > Il Circolo dell'Ultima Ora si sciolse in una settimana. Il signor Garai, il presidente del Circolo, quello del garofano nero, partì per Budapest con il treno del mattino; il capostazione giura che, quando salì sul vagone, aveva i capelli neri, e che quando il treno si mosse, dal finestrino, salutava un vecchio canuto. Le sue lettere, da allora, non hanno più la stessa calligrafia di quelle di suo padre.
  include Epilogo
  ! FINE?

:: FinaleTruffa [ending]
  # **La Grande Truffa**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} al dott. Halász – *1923.***
  > Egregio dottore, era tutto un trucco. Il dottor Lukács lo aveva sempre detto, e alla fine lo dimostrammo davanti a tutta {$townname}: fili di seta nera per sollevare il tavolino, un fabbro complice per i colpi nei muri, garza e fosforo per l'ectoplasma, e una rete di informatori (vedove, osti, il sagrestano) che raccontavano al Circolo i segreti di tutti. Le voci dei morti erano voci di vivi, ben pagate.

  > La nostra famiglia divenne celebre. Scrivemmo libri, tenemmo conferenze a Budapest e a Parigi, smascherammo trentadue medium in undici paesi. La sua Società ci ha perfino conferito una medaglia, che conservo in un cassetto.

  > Le scrivo però per dirle una cosa che non ho mai detto in pubblico. Il fabbro, interrogato, confessò di aver battuto per vent'anni nei muri di mezzo paese, su ordine del Circolo. Ma nei muri della tenuta, giurò, non aveva mai lavorato; e i colpi della prima notte, quelli del 2 novembre 1848, non li aveva fatti certo lui: allora aveva sei anni.

  > E certe notti, ancora oggi, alla tenuta qualcuno bussa. Un colpo, poi due, poi uno.
  if $confessione:
    > Al processo contro il Circolo, la prova regina fu la confessione del vecchio fabbro Jóska, con la sua croce storta in fondo alla pagina. Il giudice la lesse ad alta voce, tutta, fino all'ultima riga; e sull'ultima riga, quella della prima notte, si fermò, si tolse gli occhiali e chiese una pausa di dieci minuti.
  if $margini:
    > Il libretto francese, con i tre nomi del 1828, fu esposto in una vetrina dell'University, accanto alle scarpe dal tacco cavo e alla maschera di garza. Gli studenti lo chiamano "l'atto di nascita". Nessuno ha mai spiegato come facesse il fondatore della nostra famiglia a sapere, vent'anni prima, che cosa avrebbe bussato dopo la sua morte.
  include Epilogo
  ! FINE?

:: FinaleVoce [ending]
  # **La Voce del Padre**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} al dott. Halász – *1923.***
  > Egregio dottore, il Telegrafo batté per tre giorni e tre notti. L'ago correva sui tasti d'osso più in fretta di quanto riuscissimo a trascrivere, e ci davamo il cambio al tavolo, a turni di due ore, con le dita nere d'inchiostro. Era lui, senza alcun dubbio: le stesse abbreviazioni, gli stessi errori di ortografia, la stessa impazienza del Journal.

  > Non ci chiese come stavamo. Non ci disse com'era, dall'altra parte. Dettò, e basta: formule, tavole, disegni descritti punto per punto. Era l'ultima parte del suo Masterwork, quella che la morte gli aveva impedito di finire. Alla fine della terza notte l'ago si fermò, tornò al centro e batté un'ultima frase: *"Ora lasciatemi in pace."*

  > Lo abbiamo fatto. Il Masterwork è finito, dottore, ed è stato pubblicato con il suo nome. Il Telegrafo è smontato, in soffitta. Non lo abbiamo più acceso.

  > Non per rispetto: per paura che risponda qualcun altro.
  > Nell'ultima pagina, prima della frase finale, il padre ci nominò tutti: noi, i nostri genitori, i nostri nonni, uno per uno, con le date di nascita e di morte. Accanto a ogni nome mise un voto, come un maestro di scuola. Non ho il coraggio di dirle quale voto mise accanto al mio. Le dirò soltanto che accanto all'ultima riga, quella vuota, quella per i nostri figli, scrisse: *"Vedremo."*
  include Epilogo
  ! FINE?

:: FinaleRogo [ending]
  # **Il Rogo**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} al dott. Halász – *1923.***
  > Egregio dottore, la Chiesa ha vinto, e non è stata una vittoria gentile. Il vescovo arrivò a {$townname} nella primavera del 1906 con un decreto, due gendarmi e una lista di nomi. La nostra famiglia era in cima.

  > La sede del Circolo bruciò la notte di Pentecoste. Il fuoco, chissà come, saltò la strada e arrivò fino alla tenuta. Bruciarono le serre, le gabbie, il laboratorio, i volumi del Journal. Il Telegrafo, sciogliendosi, emise un suono che i pompieri descrissero come un lamento.

  > Sulle ceneri il vescovo ha fatto costruire una cappella dedicata alle anime del purgatorio. Ci vado ogni domenica, come tutti. Il parroco dice che le sue pareti sono le più silenziose della diocesi, e ha ragione: lì non bussa mai nessuno.

  > Ma nella cripta, sotto l'altare, dove un tempo c'era il laboratorio, il sagrestano ha smesso di scendere da anni.
  if $benedek == "amico":
    > Padre Benedek provò a fermare la folla sulla strada della tenuta, in tonaca e a braccia aperte, come un vecchio parroco di campagna davanti a un'alluvione. Lo spinsero da parte, senza cattiveria. Il giorno dopo venne tra le ceneri a benedire quello che restava, e pianse, e non si vergognò di farlo davanti a tutti.
  if $archivio:
    > Le nostre carte, quelle che avevamo murato in sacrestia con le sue, si salvarono. Il fuoco arrivò fino alla canonica e si fermò davanti all'armadio di noce, come davanti a una porta chiusa.
  include Epilogo
  ! FINE?

:: FinaleSocieta [ending]
  # **La Società dell'Ultima Ora**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} al dott. Halász – *1923.***
  > Egregio dottore, lei mi chiede chi governa {$townname}. Formalmente il consiglio comunale, e un sindaco che porta ancora il nome dei Bódi. In pratica, da quella notte del 1905, ogni decisione passa prima da un tavolino.

  > La Grande Seduta finì con la nostra famiglia alla testa del Circolo dell'Ultima Ora, e il Circolo ci accolse come si accoglie un erede atteso a lungo. Le pompe funebri, la banca, il giornale, la scuola: tutto ci appartiene, o appartiene a qualcuno che ci deve un favore. Le vedove ci benedicono. I morti, dicono, anche.

  > Non creda che sia un potere comodo. Ogni giovedì sera consultiamo chi ci ha preceduto, e i morti sono consiglieri esigenti: non dimenticano niente, non perdonano niente, e hanno tutto il tempo del mondo.

  > Le scrivo con il loro permesso. Mi hanno chiesto di dirle che il suo lavoro è stato notato, e che, quando vorrà, al nostro tavolo ci sarà una sedia anche per lei. Le consiglio di non volerlo.
  > Il signor Garai, l'uomo del garofano nero che guidava il Circolo da sempre, mi consegnò la presidenza la notte stessa, in una stanza del Tempio, davanti al ritratto del 1828. Si tolse il garofano nero dall'occhiello e me lo appuntò sul bavero, con le mani fredde. "Lo porto dal 1828", disse. "Adesso tocca a voi. È un fiore che non appassisce." Lo porto ancora. Non è mai appassito.
  include Epilogo
  ! FINE?

:: FinalePossessione [ending]
  # **Possessione**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$fiala} al dott. Halász – *1923.***
  > Caro dottore, la riconosco dalla calligrafia. Lei, invece, non riconoscerà la mia: non è quella di chi firma questa lettera. Da quando, la notte della Grande Seduta, la fiala si è rotta tra le mani di {$fiala}, questa mano scrive per me.

  > Mi presento, anche se forse ha già capito: Eszter Vámos, consolatrice. Per mezzo secolo mi hanno chiamata truffatrice, strega, profetessa, santa. Avevano tutti un po' di ragione. Il segreto della vita eterna, dottore, non era in vendita: era in quella fiala. Bastava trovare la persona giusta, abbastanza folle da lasciarmi entrare.

  > Questo corpo è più giovane del mio, e ha mani più calde: me ne servo con cura. Le scrivo perché lei sta leggendo i miei verbali, e io ho sempre avuto un debole per chi mi legge con attenzione.

  > Venga a trovarmi, quando avrà finito. Terrò una sedia vuota per lei.
  if $lettere || $margini:
    > Forse ha trovato, tra le carte, le lettere del fondatore a una certa Eszter, o un libretto francese con tre nomi in fondo all'ultima pagina. Allora sa già che io e lui fondammo il Circolo insieme, nel 1828, con un amico che amava i garofani. Ci promettemmo che chi fosse morto per primo avrebbe bussato. Lui morì per primo. Io ho mantenuto la mia parte della promessa in un altro modo.
  else:
    > Del fondatore della famiglia, le dirò soltanto che fu il primo a bussare, e che io fui la prima a rispondere. Il resto è nei verbali, se li legge con attenzione.
  include Epilogo
  ! FINE?

:: FinaleNebbia [ending]
  # **La Nebbia Eterna**
  ui generationEndingContinue enabled=true
  ! **Nota del dott. Halász – *1923.***
  > Ho cercato a lungo un erede vivente da interrogare, come ho fatto per gli altri documenti del fascicolo. Non l'ho trovato. Le carte si fermano alla notte del 31 dicembre 1905, a metà di un verbale: il velo era strappato, e la famiglia votò di non attraversarlo. Poi, dice l'ultima riga, "la nebbia entrò dalle finestre".

  > Dal 1906 {$townname} non compare più sulle carte geografiche. I treni non vi si fermano, il telegrafo non risponde, e i viaggiatori che provano ad arrivarci raccontano di aver camminato per ore in una nebbia bianca, intorno a un cimitero, prima di ritrovarsi al punto di partenza.

  > Mi chiederete, allora, dove ho trovato queste casse. Me lo chiedo anch'io. Ricordo il treno della sera, l'ombrello, il parroco gentile e molto stanco. Non ricordo come sono uscito dal villaggio.

  > Scrivo dal mio studio di Budapest. Dalla finestra, da tre giorni, non vedo che nebbia. E qualcuno, educatamente, bussa.
  > Ho chiesto alle ferrovie. L'orario del 1906 riporta ancora la fermata di {$townname}, con un asterisco: *"servizio sospeso per nebbia"*. L'orario del 1907 non la riporta più. Il capostazione della fermata precedente mi ha detto che, nelle sere d'autunno, il segnale del telegrafo dalla linea morta batte ancora, ogni tanto. Sempre lo stesso ritmo. Uno, due, uno.
  include Epilogo
  ! FINE?

// Che ne fu degli altri: una nota di Halász, comune a tutti i finali.
:: Epilogo
  ! **Nota del dott. Halász: che ne fu degli altri.**
  if $lukacs == "amico":
    > Il dottor Béla Lukács morì nel 1911, a ottantatré anni, nel suo studio all'University, con il taccuino aperto sulle ginocchia. Lasciò il suo museo della frode all'Università, con una scatola a parte, chiusa, su cui aveva scritto di suo pugno: *"Inspiegati."* Dentro c'è una busta sigillata del 1855, con un numero, quarantasette, e una nota: *"La ceralacca era stata aperta. Ma il numero l'avevo cambiato io, la mattina stessa, e non l'avevo detto a nessuno."*
  elif $lukacs == "deriso":
    > Il dottor Béla Lukács morì nel 1911, a ottantatré anni. Nelle sue memorie, tre volumi fitti di nomi, la famiglia della tenuta compare una volta sola, in una nota a piè di pagina: *"Gente che rideva troppo presto."*
  else:
    > Il dottor Béla Lukács morì nel 1911, a ottantatré anni, senza avere mai visto un fantasma, e ne andava fiero.
  if $archivio:
    > Padre Benedek morì nel 1919. È a lui, e a qualcuno di quella famiglia, che devo queste casse: le loro carte erano murate insieme alle sue, dietro l'armadio di noce, in un ripostiglio con l'interno della porta coperto di segni di nocche.
  else:
    > Padre Benedek morì nel 1919. Le carte della parrocchia le murò lui, dietro l'armadio di noce. Quelle della famiglia, dicono i suoi diari, erano rimaste nel baule dello studio della tenuta. Non so chi le abbia portate qui, né quando. Il muratore che ho interrogato giura di non avere mai riaperto quel muro.
  if $confessione:
    > La confessione del fabbro Jóska, con la sua croce storta, è nella sesta cassa, in una cartellina a parte. Sulla tomba del fabbro, al cimitero, qualcuno ha inciso un piccolo martello.
  elif $joska == "amico":
    > Sulla tomba del fabbro Jóska, al cimitero, qualcuno ha inciso un piccolo martello e, sotto, tre tacche: una, due, una.
  if $peti == "sepolto":
    > La lapide con l'angelo, quella del figlio del bottaio, c'è ancora. Qualcuno ci lascia sopra, ogni inverno, un paio di pattini da ghiaccio.
  elif $peti == "corpo":
    > Del figlio del bottaio non c'è tomba. Ci sono soltanto, tra le carte di famiglia, quaranta pagine di appunti anatomici, e l'ultima si interrompe a metà di una parola.
  elif $peti == "vegliato":
    > Al cimitero, nelle mattine di nebbia, si sentono ancora i bambini giocare a nascondino. Contano fino a cinquanta. Sono sempre uno di più.
  if $trucchi >= 5:
    > Le prove dei trucchi raccolte dalla famiglia in tre generazioni (pedali, fili, ricevute, cilindri, registri) riempiono un'intera cassa, la quinta, ordinata con una cura che commuove. Sono, a mio parere, la più bella collezione di inganni d'Europa. E nessuna di esse spiega la prima notte.
  elif $trucchi >= 2:
    > Nella quinta cassa c'è qualche prova dei trucchi del Circolo: un pedale disegnato a memoria, una fotografia doppia, qualche ricevuta. Non bastano a spiegare niente. Forse nessuno, in quella famiglia, voleva davvero che bastassero.
  if $bodi == "ricattato":
    > Il Sindaco di {$townname}, oggi, è ancora un Bódi, il quarto. Mi ha ricevuto con grande cortesia e mi ha chiesto, prima di ogni altra cosa, se tra le carte avessi trovato una certa ricevuta.
  else:
    > Il Sindaco di {$townname}, oggi, è ancora un Bódi, il quarto. Mi ha ricevuto con grande cortesia e mi ha offerto un sigaro, che non ho fumato.
  > Infine, il signor O. Garai, presidente del Circolo dell'Ultima Ora. Ieri sera, al mio club di Budapest, un signore alto con un garofano nero all'occhiello mi ha salutato per nome, si è informato con molto garbo dei miei studi e mi ha pregato di salutargli la famiglia. Il portiere del club, interrogato, sostiene che quella sera non è entrato nessuno.
