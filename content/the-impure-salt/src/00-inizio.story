// Il Sale Impuro – preparazione, prologo e pagine comuni.
// Design: docs/custom/the-impure-salt/design.it.md.
// Testo italiano completo (prima stesura, da rileggere al tavolo).

::vars
round = 0
// L'hub del Round in corso: le pagine dei traguardi ci tornano.
hub = ""
caso = ""
tracker = 0
// Lo stato della storia (vedi il design, sezione 5).
sospetto = 0
sale = 6
umber = "libero"
ombra = ""
antidoto = 0
dose = ""
primoSorso = false
internato = false
porta = false
casa = ""
accusato = ""
arrestato = false
// Quale falso allarme mostra un Avvistamento; una variante a caso (la chiromante e altri).
falso = 0
variante = 0
// I rapporti con i personaggi, decisi negli eventi dei Luoghi, che tornano più avanti.
carew = 0
haskett = 0
lomax = ""
silas = false
tomba = false
patto = 0
registroCarew = false
// La lettera del giocatore che ha la chiave della porta sul vicolo.
chiave = ""
// Gli eventi dei Luoghi già giocati (ognuno una volta sola).
evCantiere = false
evTomba = false
evHaskett = false
evLomax = false
evApprendista = false
evFucina = false
evAsilo = false
evSilas = false
// Seconda Generazione: la fiducia di Ada Haskett e di Ezra Pell, quello che la famiglia ha scoperto.
ada = 0
ezra = 0
conto = false
libro = false
polvere = false
carewParla = false
// La somma che chiude l'indagine nella Seconda Generazione (con due giocatori).
soglia = 0
evAda = false
evBanca = false
evFesta = false
evTeatro = false
evLibro = false
evEzra = false
evLomax2 = false
evChiesa = false
// Terza Generazione: le scelte e gli indizi sul notaio (contati in `indizi` l'ultima notte).
madre = false
stampa = ""
istituto = false
specchio = false
testimone = false
inchiostro = false
taccuino = false
grafia = false
indizi = 0
evMadre = false
evGiornali = false
evIstituto = false
evBanca3 = false
evNell = false
evMunicipio = false
evEmporio = false
// Secondo giro: Prima Generazione.
parroco = false
lapide = ""
evParco = false
evParroco = false
evRonda = false
// Secondo giro: Seconda Generazione.
bastone = false
boccette = ""
evSindacato = false
evPadiglione = false
evBastone = false
// Secondo giro: Terza Generazione.
aiutiEzra = 0
lettera = false
cappotto = ""
notte = ""
studio = false
fabbro = false
prova = ""
evFabbro = false
evFuneraleLomax = false
evTomba3 = false
// Terzo giro: il quinto evento di ogni Round.
evMuratori = false
evDuello = false
evNozze = false
evElezioni = false
evBecchino = false
evRicatto = false
evArchivio = false
evStatua = false
evRecita = false
// Terzo giro: gli eventi che tornano su scelte passate.
evLapide2 = false
evChiave2 = false
evBoccette3 = false
evPatto3 = false
nuovi = 0
ombraNuovo = false
// Chi gioca la pagina, dove continua ChiSei, il vincitore, l'ultima scelta.
chi = ""
dopo = ""
winner = ""
scelta = ""
// I traguardi degli Storybook token, uno per tipo e Generazione.
tkCreepy = false
tkInsanity = false
tkChemistry = false
tkVP = false
// Per giocatore: quante volte il suo scienziato ha bevuto il sale (tutte le Generazioni).
::for L in A B C D
bevuto%L% = 0
::endfor

:: Preparativi [Begins-Here]
  # **Preparativi**
  ! Completate la preparazione standard per {$players} giocatori come indicato nel regolamento, con tre eccezioni qui sotto. *Nota: il tracciato {icon:AngryMob_Icon} e il Primo Giocatore verranno stabiliti dallo Storybook nelle prossime pagine.*

  ! Prima di mescolare i mazzi, **mettete da parte**, scoperte accanto al tabellone:
  ! • il Masterwork Experiment **Love Potion**, prima di distribuire i Masterwork;
  ! • la Compulsion **"The power to change and transform…"** (*Must complete a Chemistry Type Experiment*);
  ! • i Maladjustment **Addict** e **Loose Lips**.

  ! {icon:ScenarioBox3D_Fear}
  ! Questo scenario non ufficiale usa alcuni componenti della Scatola dello Scenario **Fear of the Unknown**. Tenetela a portata di mano, ma **non apritela**: lo Storybook vi dirà di volta in volta quali componenti prendere. Tutti gli altri devono restare nella scatola, nascosti.

  [[Clicca qui per continuare... => SalePrologo]]

:: SalePrologo [voice]
  # **Il fascicolo Pell**
  ! **Lettera del notaio Ezra Pell – *1913.***
  > A chi romperà questi sigilli.

  > Se state leggendo, io sono morto, e qualcuno ha rispettato le mie ultime volontà: ne sono sorpreso, e vi ringrazio. Questo fascicolo l'ha cominciato mio padre, Silas Pell, notaio della vostra famiglia per quarant'anni, e l'ho continuato io per altri trenta. Dentro ci sono lettere, verbali di polizia, ritagli della gazzetta, un testamento e una perizia calligrafica: tutto quello che due notai onesti hanno potuto raccogliere su un uomo che, secondo l'anagrafe, non è mai nato.

  > Leggete i documenti nell'ordine in cui li ho messi, e non saltatene nessuno. E perdonate la mia mano nelle ultime pagine: da qualche anno scrivo male, e certe mattine stento a riconoscere la mia stessa grafia.

  ! **Verbale della sepoltura – notaio Silas Pell, *marzo 1861.***
  > Alle dieci del mattino, nel cimitero del villaggio, alla presenza degli eredi, del parroco e del sottoscritto, è stata tumulata la salma del defunto, chiusa nella bara la sera prima dal falegname e non più riaperta, come da sua espressa volontà. Cielo coperto. Una ventina di presenti, quasi tutti per curiosità.

  > Si annota, per scrupolo, la presenza in fondo al cimitero, accanto al cancello, di un uomo che nessuno dei presenti ha saputo nominare: piccolo di statura, con un cappotto nero troppo largo per lui. Durante la benedizione l'uomo rideva. Quando il sottoscritto si è avvicinato per chiedergli le generalità, il cancello era aperto e lui non c'era più.
  [[Clicca per continuare... => SaleG1Intro]]

// Sceglie un giocatore a caso: $caso. Il gioco è per 2–4 giocatori.
:: CasoGiocatore
  if $players == 2:
    set caso = either($nameA, $nameB)
  elif $players == 3:
    set caso = either($nameA, $nameB, $nameC)
  else:
    set caso = either($nameA, $nameB, $nameC, $nameD)

// All'inizio di ogni Generazione: Angry Mob, Suspicion Marker e Primo Giocatore.
:: PreparaFolla
  if $players == 2:
    set tracker = 6
  elif $players == 3:
    set tracker = either(6, 7)
  else:
    set tracker = either(7, 8, 9)
  include CasoGiocatore
  ! Mettete il Suspicion Marker sulla casella **{$tracker}** e il segnalino {icon:AngryMob_Icon} una casella a sinistra. Date il segnalino {icon:StartPlayerToken} a **{$caso}**.

// I traguardi degli Storybook token, uguali in ogni Generazione: le voci dell'hub.
:: Traguardi
  if !$tkCreepy:
    block hubTitle:
      ! {icon:StorybookToken} **Creepy 3**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge la casella 3 del tracciato {icon:Creepy_Icon} in questa Generazione, [[clicca qui. -> TkCreepy]]
  if !$tkInsanity:
    block hubTitle:
      ! {icon:StorybookToken} **Insanity 3**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge la casella 3 del tracciato {icon:Insanity_Icon} in questa Generazione, [[clicca qui. -> TkInsanity]]
  if !$tkChemistry:
    block hubTitle:
      ! {icon:StorybookToken} **Journal Chemistry**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge il Livello 2 del Journal Track Chemistry in questa Generazione, [[clicca qui. -> TkChemistry]]
  if !$tkVP:
    block hubTitle:
      ! {icon:StorybookToken} **15VP**
    block hubDetails:
      ! La prima volta che un giocatore raggiunge 15VP in questa Generazione, [[clicca qui. -> TkVP]]

// Rimette i traguardi all'inizio di una Generazione.
:: AzzeraTraguardi
  set tkCreepy = false
  set tkInsanity = false
  set tkChemistry = false
  set tkVP = false

:: PosaTraguardi
  set _SetupImage = "StorybookToken"
  ! **Prendete 4 token {icon:StorybookToken}.**
  ! Mettetene uno sulla **casella 3** del tracciato {icon:Creepy_Icon}, uno sulla **casella 3** del tracciato {icon:Insanity_Icon} e uno sulla **casella 15** del tracciato dei Punti Vittoria. Il quarto va in cima alla colonna del **Livello 2 del Journal Track Chemistry**: vale per tutti i giocatori.
  ! Quando il segnalino di un giocatore raggiunge uno di questi token, quel giocatore clicca sulla voce corrispondente nello Storybook e legge un messaggio. Poi il token torna nella riserva.

:: TkCreepy
  set tkCreepy = true
  # **Le chiacchiere**
  if $round <= 3:
    > Si parla di te. Al mercato le conversazioni si interrompono quando passi, e riprendono a voce più bassa appena hai voltato l'angolo. La lavandaia giura di aver visto un ometto vestito di nero uscire dal tuo vicolo all'alba, e di averlo sentito fischiettare la tua canzone preferita.
  elif $round <= 6:
    > Si parla di te, e adesso lo si scrive anche. Nella rubrica dei pettegolezzi della Gazzetta, sotto il titolo *Chi esce di notte?*, c'è un indovinello in versi su un erede "di buona famiglia e di cattive abitudini". Non fa il tuo nome. Non ce n'è bisogno: le rime sono tutte sul tuo cognome.
  else:
    > Si parla di te, e lo fanno i bambini. Per strada saltano la corda cantando una filastrocca nuova: *Umber, Umber, chi sarà? Ha la faccia di papà.* Quando passi smettono di cantare, ti guardano, e ricominciano più forte.
  ! Che cosa fai?
  [[Alimenti la voce: un po' di paura fa comodo. ~> alimenta]]
  [[La smentisci, a voce alta, dove serve. ~> smentisci]]
  fragment alimenta:
    set sospetto = $sospetto + 1
    > Non smentisci niente. Anzi, a chi ti chiede rispondi con un mezzo sorriso, e lasci che la gente tiri le sue conclusioni. Nelle settimane seguenti i fornitori consegnano in fretta, i creditori aspettano, e i becchini ti fanno lo sconto.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Bodies_Icon}. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment smentisci:
    > Ne parli con il parroco, con il direttore della banca, con le signore del comitato di beneficenza: le voci sono calunnie, e la tua famiglia ne soffre. Ti ascoltano con molta comprensione. Qualcuno, forse, ti crede.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Creepy_Icon}. Rimetti il token {icon:StorybookToken} nella riserva.

:: TkInsanity
  set tkInsanity = true
  # **Lo specchio**
  if $round <= 3:
    > Ti stai lavando il viso quando lo specchio, per un istante, ti restituisce un'altra faccia: più giovane, più piccola, con un sorriso che non hai mai fatto. Quando guardi di nuovo sei di nuovo tu; ma quel sorriso ti resta addosso per tutta la mattina, e non riesci a toglierlo.
  elif $round <= 6:
    > Nella vetrina di un negozio, mentre aspetti la carrozza, il tuo riflesso si volta un momento prima di te. Solo un momento: il tempo di un'occhiata. Poi è di nuovo al suo posto, educato, preciso, e ti imita in tutto. Quasi in tutto: lui non ha il cappello in mano.
  else:
    > Nella fotografia di famiglia appena ritirata dallo studio del fotografo, tutti guardano l'obiettivo. Tutti tranne te: nella fotografia guardi di lato, verso la porta, e sorridi. Il fotografo giura di non aver ritoccato niente. Tu giuri di non aver mai sorriso così.
  ! Che cosa fai?
  [[Rompi lo specchio. ~> rompi]]
  [[Guardi più a lungo. ~> guarda]]
  fragment rompi:
    > Rompi il vetro con il palmo della mano, senza pensarci. Il dolore ti fa bene: è tuo, e di nessun altro. Ti fasci la mano con un fazzoletto e per un po', la sera, eviti le superfici lucide.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon} e paga $1. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment guarda:
    > Guardi più a lungo. L'altra faccia non si fa più vedere, ma ti lascia qualcosa: un'idea, nitida e completa, come se qualcuno te l'avesse sussurrata all'orecchio mentre non stavi attento.
    block setupEvent next=$hub:
      ! Pesca un Esperimento dal mazzo che preferisci. Rimetti il token {icon:StorybookToken} nella riserva.

:: TkChemistry
  set tkChemistry = true
  # **La formula**
  if $round <= 3:
    > Sul tuo diario, sotto gli appunti di ieri sera, c'è una pagina che non ricordi di aver scritto. È una formula, ed è giusta: più elegante di qualunque cosa tu abbia mai trovato. L'inchiostro è quello del tuo calamaio. La grafia è inclinata all'indietro.
  elif $round <= 6:
    > Una lettera senza mittente, imbucata in città: dentro, su carta della tenuta, la soluzione del problema che ti tormenta da mesi, scritta con una sicurezza che non hai mai avuto. Il timbro postale è di ieri notte. Ieri notte, a quanto ricordi, dormivi.
  else:
    > Ti svegli alla scrivania del laboratorio con la penna in mano e il collo indolenzito. Davanti a te, tre pagine fitte di calcoli: tutti giusti, tutti nuovi. Le prime righe sono nella tua grafia. Le ultime, sempre più piccole e più svelte, pendono all'indietro.
  ! Che cosa fai?
  [[Usi la formula. ~> usa]]
  [[La bruci. ~> brucia]]
  fragment usa:
    > La formula funziona, naturalmente. Funziona così bene che per un giorno intero ti senti un genio, e per una notte intera hai paura di addormentarti.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Chemical_Icon} e 1 Conoscenza Chimica (Chemistry Knowledge). Avanza di 1 casella sul tracciato {icon:Insanity_Icon}. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment brucia:
    > La bruci nella stufa del laboratorio, foglio per foglio, e guardi la carta annerire finché non resta niente. Quello che trovi senza aiuto è meno bello. Ma è tuo.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Rimetti il token {icon:StorybookToken} nella riserva.

:: TkVP
  set tkVP = true
  # **Una persona rispettabile**
  if $round <= 3:
    > Arriva un invito su carta pesante: una cena da gente per bene, con il direttore della banca e due signore che finanziano le opere di carità. Per tutta la sera nessuno, a tavola, nomina Umber. Al momento del congedo il padrone di casa ti stringe la mano più a lungo del necessario e ti mette in mano una busta: "Per le vostre ricerche. La scienza ha bisogno di persone rispettabili."
  elif $round <= 6:
    > Il circolo cittadino, quello con le poltrone di cuoio e il ritratto del sovrano, ti propone come socio. Ti accolgono con un brindisi e un discorso sul progresso. Più tardi, in biblioteca, il presidente ti prende da parte: alcuni soci finanzierebbero volentieri le tue ricerche, purché il nome della tenuta resti fuori dai giornali.
  else:
    > L'università della capitale ti invita a tenere una conferenza. L'aula è piena: professori, studenti, giornalisti, e in ultima fila signore con il velo che prendono appunti. Alla fine un anziano accademico si alza e ti offre una borsa di ricerca. Poi aggiunge, con un sorriso, che naturalmente nessuno crede alle storie sul sale.
  ! Che cosa fai?
  [[Accetti il denaro, e taci. ~> accetta]]
  [[Rifiuti, e parli di Umber davanti a tutti. ~> parla]]
  fragment accetta:
    > Accetti, ringrazi e non dici una parola di troppo. Il denaro è buono, la compagnia è buona, il silenzio è ottimo. Tornando a casa ti accorgi di avere fischiettato tutta la strada, e di non conoscere la canzone.
    block setupEvent next=$hub:
      ! Guadagni $2. Rimetti il token {icon:StorybookToken} nella riserva.
  fragment parla:
    set sospetto = $sospetto - 1
    > Rifiuti, gentilmente, e racconti di Umber: gli assegni, le notti, la tua famiglia. Il silenzio che segue è lunghissimo. Poi qualcuno applaude, e altri lo seguono, incerti. Hai detto la verità in un posto dove non si usa, e a qualcuno, stranamente, è piaciuto.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Rimetti il token {icon:StorybookToken} nella riserva.

// Chi gioca la pagina. Imposta $chi (una lettera) e continua con $dopo.
:: ChiSei
  ! Chi sta leggendo?
  [[{$nameA} ~> a]]
  [[{$nameB} ~> b]]
  if $players > 2:
    [[{$nameC} ~> c]]
  if $players > 3:
    [[{$nameD} ~> d]]
  fragment a:
    set chi = "A"
    goto $dopo
  fragment b:
    set chi = "B"
    goto $dopo
  fragment c:
    set chi = "C"
    goto $dopo
  fragment d:
    set chi = "D"
    goto $dopo

// Bere il sale: la scelta segreta che torna in tutto lo scenario (design, sezione 5).
// Si arriva da ChiSei con $chi; torna all'hub.
:: Bevi
  @@ **Questa pagina è segreta: non mostrarla agli altri.**
  # **Il sale**
  if $round >= 7:
    > La boccetta viene dalla farmacia, come tutte: sale bianco, purissimo, con l'etichetta nuova. Nell'acqua il colore comincia a cambiare, ma non come dovrebbe. Diventa rosso, e si ferma lì, come una ferita che non si chiude.
  elif $sale <= 0:
    > Apri il cassetto del laboratorio: le boccette sono vuote. Ne resta solo l'odore, amaro, sul fondo di vetro. Lo annusi a lungo, prima di rimetterle a posto.
    [[Torna al Round. => $hub]]
  elif $round >= 4:
    > La cassetta di zinco è ancora sotto la tavola smossa, accanto alla stufa, dove la trovarono i vostri genitori. Le boccette rimaste sono **{$sale}**. In venticinque anni il sale ha preso un colore più caldo, quasi d'avorio, e un odore leggero di mandorla amara. Nel bicchiere, però, fa ancora quello che deve: rosso, viola, verde. Chi l'ha bevuto prima di te è morto nel suo letto. Più o meno.
  else:
    > La polvere bianca cade nel bicchiere d'acqua, e il colore comincia a cambiare: rosso, poi viola scuro, poi il verde di uno stagno. La mano ti trema un poco. Basta un sorso.
  if $round >= 7 || $sale > 0:
    [[Bevi. ~> si]]
    [[Non bevi. ~> no]]
  fragment si:
    set sospetto = $sospetto + 1
::for L in A B C D
    if $chi == "%L%":
      set bevuto%L% = $bevuto%L% + 1
::endfor
    if $round >= 7:
      set nuovi = $nuovi + 1
      if $chi == $ombra:
        set ombraNuovo = true
      > Il sale nuovo funziona, ma nel verso sbagliato. L'altro esce come sempre, svelto e allegro; ma al mattino, quando provi a tornare, una parte di te resta fuori dalla porta, e non vuole rientrare.
      block setupEvent next=$hub:
        ! Guadagni 1 {icon:Insanity_Icon} e 1 {icon:Creepy_Icon}. Non guadagni risorse.
    else:
      set sale = $sale - 1
      if $round >= 4:
        > Il dolore dura un minuto, come raccontava il diario: le ossa, il cuore, il pavimento. Poi esci nella città di pietra, nel corpo piccolo e svelto dell'altro, e la città è tua. Corri sui tetti bagnati, ti specchi nelle vetrine chiuse, accendi un sigaro con un lampione a gas e lo spegni con un soffio. Ridi, e la nebbia ti ride dietro.

        > Al mattino ti svegli nel tuo letto, con le scarpe sporche di fuliggine. In tasca hai un assegno firmato con il tuo nome, e il biglietto di un teatro in cui non hai mai messo piede.
      else:
        > Il dolore dura un minuto: le ossa che stridono, il cuore che salta, il pavimento che si avvicina. Poi arriva una leggerezza nuova: un corpo piccolo e svelto, senza un rimorso al mondo, che esce dalla porta di servizio.

        > Al mattino ti svegli nel tuo letto, con le scarpe sporche di fango. In tasca hai un assegno firmato con il tuo nome, in una grafia che pende all'indietro.
      block setupEvent next=BeviEffetti:
        ! Guadagni subito una risorsa a scelta ({icon:Bodies_Icon}, {icon:Chemical_Icon}, {icon:Gears_Icon} o {icon:Animal_Icon}) e 1 {icon:Insanity_Icon}.
  fragment no:
    if $round >= 7:
      > Rovesci il bicchiere nel lavandino e guardi il rosso andare giù per lo scarico, lentamente, come se non volesse. Nessuno saprà che cosa hai scelto. Nemmeno l'altro, forse.
    else:
      > Rimetti la boccetta nel cassetto e giri la chiave due volte. Le mani ti tremano ancora quando torni dagli altri. Nessuno saprà che cosa hai scelto.
    block setupEvent next=$hub:
      ! Non succede niente.

// Le conseguenze del sale vecchio: la prima volta di tutti, la prima di ognuno, la terza.
:: BeviEffetti
  @@ **Questa pagina è segreta: non mostrarla agli altri.**
  # **Dopo il sorso**
  if !$primoSorso:
    set primoSorso = true
    ! Nessuno aveva ancora bevuto il sale prima di te: prendi il Masterwork **Love Potion** messo da parte e mettilo al posto del tuo Masterwork, che torna nella scatola. Prendi anche la Compulsion **"The power to change and transform…"** messa da parte.
::for L in A B C D
  if $chi == "%L%" && $bevuto%L% == 1:
    set _SetupImage = "S2_Obsession"
    ! È la prima volta che bevi: pesca due **Obsession card** dalla scatola, tienine una e rimetti l'altra.
  if $chi == "%L%" && $bevuto%L% == 3:
    set _SetupImage = "MaladjustmentBack"
    ! È la terza volta: prendi il Maladjustment **Addict** messo da parte.
::endfor
  ! Mettete un **Avvistamento** {icon:S2_HuntTokenFRONT} a faccia in giù su un Luogo a scelta di chi ha bevuto.
  [[Torna al Round. => $hub]]
