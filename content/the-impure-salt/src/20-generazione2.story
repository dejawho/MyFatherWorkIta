// Seconda Generazione – "La nebbia di pietra" (1886–1895).
// Luoghi delle pagine della Chronicle: FotU 8 (Jail, Bank, Fortune Teller); FotU 19 (Town Hall,
// Traveling Caravan, Library, Farmer's Market); FotU 21 o 19 (Cemetery, General Store, Church).

:: SaleG2Intro [INTRO voice]
  # **GENERAZIONE II: La nebbia di pietra**
  ! **Nota del notaio Ezra Pell al fascicolo – *1886.***
  > Mio padre è morto due anni fa, con la penna in mano, a metà di un atto di compravendita. Mi ha lasciato lo studio, i clienti, una credenza chiusa a chiave di cui non ho mai trovato la chiave, e questo fascicolo, che non avrei dovuto riaprire.
  if $silas:
    > Negli ultimi anni mio padre non dormiva più a letto. Da quando uno degli eredi della tenuta era andato a cercarlo al cimitero, di notte, a fargli domande, dormiva nello studio, in poltrona, davanti alla credenza.

  > In venticinque anni il villaggio è diventato una città. Le case a graticcio sono cadute una dopo l'altra, e al loro posto sono cresciute case di pietra grigia, tutte uguali, con i lampioni a gas davanti alla porta. È arrivata la ferrovia, e con la ferrovia la fuliggine. Del vecchio non si è saputo più niente: per la legge è morto nel 1861, e nessuno ha voglia di riaprire la questione.

  > Gli avvistamenti di Mr. Umber, invece, non sono mai finiti. Un piccolo uomo con il cappotto nero, mai invecchiato di un giorno, che paga con assegni firmati da persone rispettabili e ride in fondo alle strade. Oggi gli eredi della tenuta sono i nipoti del vecchio. Nessuno di loro ha mai visto le boccette del sale, e tutti sanno dove sono.

  > Sono cresciuti con le storie, come si cresce con il pane: il nonno che non era morto, la bara piena di pietre, la porta senza maniglia. A scuola i compagni facevano a gara a chi aveva più coraggio di toccare il cancello della tenuta. Adesso i compagni sono avvocati, medici, consiglieri comunali, e passano dall'altro lato della strada.
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    include SceltaOmbra
    block setupEvent next=G2SognoA:
      include AzzeraTraguardi
      include PosaTraguardi
      ! Prendete dalla Scatola di **Fear of the Unknown** le **Vanity Estate Upgrade** e aggiungetele a quelle disponibili.

// Secondo colpo di scena: Umber si eredita. L'app sceglie a caso l'Erede nell'Ombra (una lettera,
// o nessuno: solo con 2 giocatori, perché l'altro non lo capisca per esclusione).
:: SceltaOmbra
  if $players == 2:
    set ombra = either("A", "B", "")
  elif $players == 3:
    set ombra = either("A", "B", "C")
  else:
    set ombra = either("A", "B", "C", "D")

// Una pagina segreta per tutti, della stessa lunghezza: nessuno si tradisce dal tempo di lettura.
::for L in A B C D | Fine
:: G2Sogno%L%
  if %L.n% > $players:
    goto G2SognoFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **Un sogno inquieto**
  if $ombra == "%L%":
    > Ti svegli prima dell'alba sopra le coperte, con i vestiti addosso. Le scarpe sono sporche di fango del fiume. In tasca c'è un assegno firmato con il tuo nome, con la tua mano: ma la scrittura pende all'indietro. Non hai mai toccato il sale. Non ne hai avuto bisogno: chi è venuto prima di te l'aveva bevuto per te. Umber sei tu. Da sempre.
    ! **Sei l'Erede nell'Ombra.** Non dirlo a nessuno. Guadagni 1VP per ogni tuo assegno che resta su un Luogo a fine Round. Alla fine della Generazione la famiglia accuserà qualcuno.
    ! Che cosa fai dell'assegno?
    [[Lo incassi. ~> uno]]
    [[Lo bruci. ~> due]]
  else:
    > Sogni il vicolo dietro la tenuta, la porta senza maniglia, una risata che viene da dietro le tue spalle e che conosci da sempre. Ti svegli di soprassalto, con il cuore in gola. Il letto è in ordine, le scarpe sono pulite accanto alla porta, le tasche vuote. Eppure, per un momento, avresti giurato di avere le mani sporche di fango.
    ! Non sei l'Erede nell'Ombra. Uno di voi potrebbe esserlo, o forse nessuno: osservate chi mette gli assegni, e quando.
    ! Che cosa fai, adesso?
    [[Frughi nel cappotto appeso all'ingresso. ~> uno]]
    [[Torni a dormire. ~> due]]
  fragment uno:
    if $ombra == "%L%":
      > In banca il cassiere guarda la firma, guarda te, e conta il denaro senza dire niente.
    else:
      > Nella tasca del cappotto c'è del denaro che non ricordi di averci messo.
    block setupEvent next=G2Sogno%L.next%:
      ! Guadagni $2.
  fragment due:
    if $ombra == "%L%":
      > La carta brucia in fretta, con una fiamma verdognola. Ti senti meglio, quasi.
    else:
      > Il sonno arriva subito, profondo e senza sogni. Ti senti meglio, quasi.
    block setupEvent next=G2Sogno%L.next%:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
::endfor

:: G2SognoFine
  # **La città di pietra**
  > Dove c'era il mercato del villaggio, adesso c'è la Jail: un edificio di mattoni rossi con le finestre a grata, che la gente chiama "il nuovo albergo". Il fiume è stato coperto per metà, e sopra ci passano le carrozze.

  > L'Ispettore Nell Haskett è andata in pensione. Vive in una casetta vicino alla stazione, con un gatto e il suo vecchio taccuino nero, e riceve ancora visite dal suo successore: sua nipote, l'Ispettore Ada Haskett, che ha gli stessi occhi e una matita più appuntita. Il primo fascicolo che Ada ha aperto, il giorno della nomina, è stato quello di Mr. Umber.

  > Alla tenuta, intanto, arriva un signore della compagnia ferroviaria, con i baffi cerati e una cartella di cuoio. La nuova linea deve passare lungo il confine della tenuta, proprio dietro il vicolo. La compagnia offre un buon prezzo per la striscia di terra, e un prezzo ancora migliore se la famiglia firma in fretta.
  ! Che cosa fate? *(Decidete insieme.)*
  [[Vendete la terra lungo il vicolo. ~> vendi]]
  [[Rifiutate. ~> rifiuta]]
  fragment vendi:
    set sospetto = $sospetto - 1
    > Firmate in fretta, e la compagnia paga in fretta. Un mese dopo gli operai abbattono il muro di cinta e posano i binari a dieci metri dal vicolo. Di notte, adesso, passano i treni merci, e nessuno sente più niente: né passi, né risate.
    block setupEvent next=G2R1:
      ! Ogni giocatore guadagna $2.
  fragment rifiuta:
    > Rifiutate. Il signore con i baffi cerati se ne va scuotendo la testa, e la linea fa una curva larga intorno alla tenuta, che sulle mappe della compagnia viene segnata in grigio, come le paludi. In città dicono che la famiglia abbia qualcosa da nascondere, dietro quel muro. Non hanno tutti i torti.
    block setupEvent next=G2R1:
      ! Ogni giocatore guadagna 1VP.

:: G2R1 [HUB]
  # **IL SALE IMPURO – Giovinezza**
  set round = 4
  if $hub != "G2R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 8**.
      include PreparaFolla
  set hub = "G2R1"
  include Traguardi
  include VociSale
  if !$evAda:
    block hubTitle:
      ! {icon:Storybook} **La nipote dell'Ispettore – Jail**
    block hubDetails:
      ! L'Ispettore Ada Haskett ha l'ufficio nella nuova Jail. Il primo giocatore che ci manda un suo pezzo [[clicca qui. -> G2Ada]]
  if !$evBanca:
    block hubTitle:
      ! {icon:Storybook} **Il conto del vecchio – Bank**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Bank [[clicca qui. -> G2Banca]]
  if !$evElezioni:
    block hubTitle:
      ! {icon:Storybook} **Le elezioni – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G2Elezioni]]
  if !$evLapide2 && $lapide != "":
    block hubTitle:
      ! {icon:Storybook} **La tomba del nonno – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G2Lapide]]
  if !$evSindacato:
    block hubTitle:
      ! {icon:Storybook} **Lo sciopero – Laborer's Union**
    block hubDetails:
      ! Gli operai della ferrovia sono in sciopero. Il primo giocatore che manda un suo pezzo al Laborer's Union [[clicca qui. -> G2Sindacato]]
  block hubTitle:
    ! {icon:Storybook} **La chiromante – Fortune Teller**
  block hubDetails:
    ! La vecchia chiromante legge ancora la mano, o forse è sua figlia. Quando un tuo pezzo visita il Fortune Teller, puoi pagare $1: [[clicca qui. -> G1Chiromante]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > Gli assegni di Umber ricompaiono nelle botteghe, firmati con i vostri nomi. Nessuno, in famiglia, ammette di aver bevuto il sale.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G2R1" next="G2BigliettoA"

::round G2R1 4
fine: La Giovinezza della Seconda Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

:: G2Ada
  set evAda = true
  # **La nipote dell'Ispettore**
  > La nuova Jail ha il riscaldamento a vapore, le celle numerate e un ufficio al primo piano con la finestra sul cortile. L'Ispettore Ada Haskett è giovane, più giovane di quanto ti aspettassi, con gli occhi della zia e una matita ancora più appuntita. Sulla scrivania ha un solo fascicolo, grosso come un messale. Sulla copertina c'è scritto *Umber*.
  if $haskett > 0:
    > "Mia zia mi ha parlato della vostra famiglia", dice, prima ancora che tu apra bocca. "Dice che con voi si può parlare. Spero che abbia ragione. Di solito ce l'ha."
  elif $haskett < 0:
    > "Mia zia mi ha parlato della vostra famiglia", dice, prima ancora che tu apra bocca. "Mi ha detto di non credere a una parola di quello che mi direte. Di solito ha ragione."
  else:
    > "Mia zia mi ha parlato della vostra famiglia", dice. "Non mi ha detto se fidarmi. Credo che volesse lasciarmi il piacere di scoprirlo."
  ! Che cosa fai?
  [[Le offri il tuo aiuto contro Umber. ~> aiuto]]
  [[Le chiedi di lasciare in pace la tua famiglia. ~> pace]]
  [[Paghi $2 per sapere dove è stato visto Umber l'ultima volta. ~> busta]]
  fragment aiuto:
    set ada = $ada + 1
    > Ada ti guarda a lungo, come se cercasse il punto in cui stai mentendo. Poi apre un cassetto e ti dà un fischietto d'ottone, di quelli delle guardie. "Se lo vedete, fischiate", dice. "E se un giorno dovrete dirmi qualcosa che non vi piace, venite da me prima che io venga da voi."
    block setupEvent next=$hub:
      ! Guadagni 1VP. L'Ispettore Ada Haskett si ricorderà della tua famiglia.
  fragment pace:
    > Ada sorride. "Volentieri", dice. "Il giorno in cui Umber lascerà in pace la città, io lascerò in pace voi." Scrive una riga sul fascicolo, lo chiude e ti augura la buona giornata. È la prima volta che una buona giornata ti suona come una minaccia.
    block setupEvent next=$hub:
      ! Non succede niente.
  fragment busta:
    set ada = $ada - 1
    set sospetto = $sospetto + 1
    > Ada conta le monete davanti a te, una per una, e le chiude nel cassetto con l'etichetta *Prove*. Poi ti dice dove Umber è stato visto l'ultima volta, e ti ringrazia: "Questa la aggiungo al fascicolo."
    block setupEvent next=$hub:
      ! Paga $2. Guarda in segreto un Avvistamento {icon:S2_HuntTokenFRONT} a faccia in giù sul tabellone, senza girarlo. L'Ispettore Ada Haskett si ricorderà della tua famiglia.

:: G2Elezioni
  set evElezioni = true
  # **Le elezioni**
  > Si vota per il consiglio comunale, e al municipio i manifesti dei candidati coprono i muri fino al soffitto. Ce n'è uno che non ha né foto né programma: soltanto un nome, *U. Mber*, e la promessa di "lampioni accesi tutta la notte, perché ognuno possa vedere chi gli cammina accanto". Il segretario comunale giura che la candidatura è regolare: la cauzione è stata pagata con un assegno.
  ! Che cosa fai?
  [[Strappi i manifesti. ~> strappa]]
  [[Ti candidi anche tu, contro di lui. ~> candida]]
  [[Lo voti, per vedere che cosa succede. ~> vota]]
  fragment strappa:
    set sospetto = $sospetto + 1
    > Li strappi tutti, uno per uno, davanti al municipio, in pieno giorno. Una guardia ti guarda fare senza intervenire, poi scrive qualcosa sul taccuino. All'alba i manifesti sono di nuovo al loro posto, più grandi.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon}.
  fragment candida:
    > Fai stampare i manifesti, stringi mani al mercato, prometti fogne nuove e meno nebbia. Perdi, naturalmente, ma con onore. *U. Mber* prende un voto solo, e nessuno sa di chi: lo scrutatore giura di aver contato tre volte. Eppure la sera dello scrutinio, in municipio, qualcuno ride per un'ora intera.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP.
  fragment vota:
    > Nella cabina scrivi il suo nome con la tua matita, con la tua grafia, e ti accorgi a metà che le lettere stanno pendendo all'indietro. Quando esci, lo scrutatore ti augura la buona notte con il tuo nome di battesimo, anche se non vi siete mai visti.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e $1: qualcuno ti ha infilato una moneta nella tasca del cappotto.

:: G2Lapide
  set evLapide2 = true
  # **La tomba del nonno**
  if $lapide == "torna presto":
    > Sulla tomba del nonno, sotto il nome, le parole fatte incidere dai vostri genitori si leggono ancora: *Torna presto*. Qualcuno le ha ripassate con lo scalpello di recente: i solchi sono bianchi e puliti. Davanti alla lapide, le violette di sempre.
  elif $lapide == "senza nome":
    > La lapide senza nome del nonno è coperta di muschio, tranne in un punto: dove una volta c'era il nome, qualcuno ha raschiato il muschio con l'unghia, lettera per lettera, e il nome si legge di nuovo, verde su grigio. Davanti alla lapide, dopo tanti anni, sono tornate le violette.
  else:
    > La tomba del nonno è come la lasciarono i vostri genitori: il nome, le due date, una croce. La terra davanti è smossa, ogni tanto, come se qualcuno ci dormisse sopra. Davanti alla lapide, le violette di sempre.
  ! Che cosa fai?
  [[Fai sorvegliare la tomba, di notte, per una settimana ($2). ~> guardia]]
  [[Lasci un biglietto sotto le violette. ~> biglietto]]
  fragment guardia:
    > Il custode sorveglia per sei notti e non vede niente. La settima si addormenta. Al mattino le violette sono fresche, e sul suo cappello, appoggiato alla lapide, c'è un assegno: il compenso della settimana, "per la cortesia".
    block setupEvent next=$hub:
      ! Paga $2. Guadagni 2VP.
  fragment biglietto:
    > Scrivi poche righe: *Chi sei? Che cosa vuoi?* L'indomani il biglietto non c'è più. Al suo posto ce n'è un altro, nella grafia che pende all'indietro: *Sono di famiglia. Voglio quello che vuoi tu.*
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1 {icon:Creepy_Icon}.

:: G2Chiave
  set evChiave2 = true
  # **La chiave che tira**
  > La chiave senza denti, quella con la testa a forma di occhio, è rimasta per vent'anni in fondo a un cassetto. Quando la prendi in mano è tiepida, e tira: leggermente, con pazienza, verso il fondo della casa, verso il vicolo, come l'ago di una bussola. Di notte, nel silenzio, si sente perfino un piccolo ronzio.
  ! Che cosa fai?
  [[La segui, di notte. ~> segui]]
  [[La butti nel fiume. ~> fiume]]
  fragment segui:
    > La chiave ti porta lungo il corridoio, giù per la scala di servizio, fino a una parete dove non c'è nessuna porta. La appoggi al muro, e il muro si apre: è lo studio degli specchi. Alla scrivania, di spalle, c'è qualcuno che scrive, con la penna che gratta la carta. Indossa un cappotto nero. Non si volta. Tu non resti a vedere chi è.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1 Conoscenza Occulta (Occult Knowledge).
  fragment fiume:
    set sospetto = $sospetto - 1
    > La butti dal ponte, di giorno, davanti a tutti. Affonda subito, senza un rumore. Quella notte dormi come non dormivi da anni. La mattina dopo, sul tuo comodino, c'è una pozzanghera d'acqua di fiume, piccola, a forma di chiave.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Sindacato
  set evSindacato = true
  # **Lo sciopero**
  > Gli operai della ferrovia sono in sciopero da tre settimane. Il sindacato ha la sede in una stanza fumosa sopra un'osteria, con le sedie spaiate e il ritratto di un vecchio sindacalista barbuto appeso storto. Lo sciopero dovrebbe essere finito da un pezzo, perché gli operai non hanno più un soldo. Eppure resistono. Qualcuno, ogni venerdì, paga loro la settimana, con un assegno.
  ! Che cosa fai?
  [[Dai $2 alla cassa dello sciopero. ~> cassa]]
  [[Chiedi di vedere uno degli assegni. ~> assegno]]
  [[Avverti la compagnia ferroviaria. ~> compagnia]]
  fragment cassa:
    set sospetto = $sospetto - 1
    > Gli operai ti applaudono, il segretario del sindacato ti stringe la mano con le sue mani nere di carbone. Per una settimana, in città, la famiglia della tenuta è "quella che sta con gli operai". I signori del circolo non te lo perdoneranno; gli operai non lo dimenticheranno.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP.
  fragment assegno:
    > Il segretario esita, poi ti mostra l'assegno di venerdì scorso. È intestato al sindacato e firmato con il nome di uno di voi, nella grafia che pende all'indietro. Sul retro, a matita, qualcuno ha scritto: *Resistete. Fa bene alla salute.*
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 1 {icon:Insanity_Icon}.
  fragment compagnia:
    set sospetto = $sospetto + 1
    > La compagnia ringrazia e fa bloccare gli assegni in banca. Lo sciopero finisce in una settimana, per fame. Quella notte stessa, sul muro della tenuta, qualcuno ha scritto con il carbone: *SPIA DI UMBER*.
    block setupEvent next=$hub:
      ! Guadagni $3.

:: G2Banca
  set evBanca = true
  # **Il conto del vecchio**
  > Il direttore della Bank è un uomo rosa e rotondo, che parla piano come in chiesa. Ti spiega, con molto imbarazzo, che il conto di vostro nonno non è mai stato chiuso. Il testamento lo lascia a Mr. Umber, e il notaio non ha mai dato il permesso di chiuderlo. Così il conto vive: ogni settimana qualcuno preleva con un assegno, e ogni mese qualcuno versa, in contanti, sempre la stessa cifra.
  if $patto > 0:
    set sospetto = $sospetto + 1
    > Tra gli assegni del mese scorso ce n'è uno che il direttore ti mostra a parte, tenendolo con due dita: la firma è di uno dei vostri genitori, ed è autentica. È datata 1877. È stata compilata la settimana scorsa.
  ! Che cosa fai?
  [[Paghi $2 al direttore per sapere chi fa i versamenti. ~> versamenti]]
  [[Chiedi che il conto venga chiuso. ~> chiudi]]
  fragment versamenti:
    set conto = true
    > Il direttore sfoglia il registro, si bagna il dito, sfoglia ancora. I versamenti li porta un giovane impiegato con le maniche di lustrino, sempre lo stesso, che non lascia il nome e non chiede la ricevuta. Il direttore lo conosce di vista: è il commesso dello **studio notarile Pell**. I versamenti sono cominciati prima della morte del vecchio Silas. E sono continuati dopo.
    block setupEvent next=$hub:
      ! Paga $2. Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment chiudi:
    set sospetto = $sospetto + 1
    > Il direttore allarga le braccia. Senza il permesso del notaio non può, e il notaio Ezra Pell, interpellato, ha già risposto di no: "Il conto resterà aperto finché Mr. Umber non verrà a chiuderlo di persona." In città, intanto, si sparge la voce che la famiglia della tenuta vuole i soldi di Umber.
    block setupEvent next=$hub:
      ! Guadagni $2: il direttore vi rimborsa, per scusarsi, le spese di un vecchio errore.

// Il biglietto notturno: uno solo, a metà Generazione, per tutti (stessa lunghezza).
::for L in A B C D | Fine
:: G2Biglietto%L%
  if %L.n% > $players:
    goto G2BigliettoFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **Un biglietto sotto la porta**
  if $ombra == "%L%":
    > Un biglietto piegato in quattro, infilato sotto la porta della tua camera. Riconosci la carta: è quella del tuo scrittoio. Riconosci la grafia: è la tua. *Stanotte, al mercato. Lo sai già.*
    ! In questo Round metti il tuo Money token sul Farmer's Market, anche se non hai bevuto.
  else:
    > Un biglietto piegato in quattro, infilato sotto la porta della tua camera. La carta è quella della tenuta. La grafia è minuta, svelta, inclinata all'indietro. *Guarda chi va al mercato.*
    ! Non devi fare niente. Ma ricordati chi mette un assegno sul Farmer's Market.
  ! Che cosa fai del biglietto?
  [[Lo bruci nella candela. ~> brucia]]
  [[Lo conservi nel tuo diario. ~> tieni]]
  fragment brucia:
    > La carta si accartoccia e diventa cenere in un attimo. Resta l'odore, e la frase, che continui a ripeterti fino all'alba.
    block setupEvent next=G2Biglietto%L.next%:
      ! Non succede niente.
  fragment tieni:
    > Lo infili tra le pagine del diario, dove nessuno lo cercherà. Ogni tanto, la notte, lo rileggi. Ogni volta la grafia ti sembra un po' più familiare.
    block setupEvent next=G2Biglietto%L.next%:
      ! Guadagni 1VP e 1 {icon:Insanity_Icon}.
::endfor

:: G2BigliettoFine
  # **La nebbia**
  > Quell'autunno una nebbia gialla scende dalla collina e si posa sulla città come un coperchio. Sa di zolfo e di fiume. I lampioni si accendono a mezzogiorno e non bastano a vedere l'altro lato della strada; le carrozze vanno al passo, con un ragazzo davanti che agita una lanterna.

  > Nella nebbia, dicono, Umber cammina più tranquillo. Le guardie di Ada Haskett hanno l'ordine di fermare ogni uomo basso con il cappotto nero. In una settimana ne fermano quaranta, e li rilasciano tutti.
  include CasoGiocatore

  > La quarantunesima persona fermata è **{$caso}**: alle due di notte, sul ponte, senza cappello, con le scarpe bagnate e senza una spiegazione che convinca le guardie. Passa la notte in una cella della Jail. All'alba la famiglia può pagare una cauzione, oppure lasciare che risponda alle domande di Ada Haskett finché lei non sarà soddisfatta.
  ! Che cosa fate? *(Decide {$caso}, sentiti gli altri.)*
  [[Pagate la cauzione. ~> paga]]
  [[Lasciate che risponda alle domande. ~> resta]]
  fragment paga:
    set sospetto = $sospetto + 1
    > La cauzione è alta, e la Gazzetta ne pubblica la cifra esatta. **{$caso}** torna a casa per colazione, con il raffreddore e una gran voglia di non parlarne.
    block setupEvent next=G2Cronaca1:
      ! **{$caso}** paga $2.
  fragment resta:
    set ada = $ada + 1
    > **{$caso}** risponde a tutte le domande di Ada Haskett per un giorno intero, con pazienza, e alla fine esce senza accuse. Ada accompagna {$caso} fino alla porta. "Non so ancora se mi avete detto la verità", dice. "Ma almeno non siete scappati."
    block setupEvent next=G2Cronaca1:
      ! **{$caso}** avanza di 1 casella sul tracciato {icon:Insanity_Icon} e guadagna 1VP.

:: G2Cronaca1
  # **Cronaca cittadina**
  ! **Gazzetta di {$townname} – *1887.***
  > **LA CITTÀ CHE CRESCE.** Con l'apertura della nuova linea ferroviaria, la popolazione della città ha superato quest'anno le diecimila anime. Sono state accese altre duecento lanterne a gas, e il consiglio comunale ha approvato la copertura di un altro tratto del fiume, "per ragioni d'igiene e di decoro".
  if $evElezioni:
    > Le elezioni comunali si sono svolte regolarmente, malgrado una curiosa candidatura, presentata da un certo *U. Mber* e corredata di manifesti che hanno coperto i muri del municipio. Il candidato non si è presentato allo scrutinio.
  if $evSindacato:
    > Si è chiuso lo sciopero dei ferrovieri. Il sindacato e la compagnia ne danno versioni opposte; tutti e due, però, parlano di assegni di provenienza misteriosa.
  if $evAda:
    > L'Ispettore Ada Haskett, nipote della celebre Nell, ha confermato a questo giornale che il fascicolo Umber è "la priorità assoluta" del suo ufficio. Ha aggiunto di poter contare sulla collaborazione di alcune famiglie della città. Non ha detto quali.
  if $evBanca:
    > Negli ambienti della Bank si parla di un conto molto antico, intestato a un defunto e mai chiuso, sul quale continuano a muoversi somme considerevoli. Il direttore si è rifiutato di commentare.
  if $sospetto >= 6:
    > Nei quartieri bassi, intanto, cresce il malumore contro la famiglia della tenuta. Ieri sera qualcuno ha scritto con il carbone, sul muro di cinta, una parola che questo giornale non può riportare.
  else:
    > Per il resto, la stagione è stata tranquilla. Il teatro ha registrato il tutto esaurito, la banda ha suonato ogni domenica nel parco, e la nebbia, per ora, è rimasta sulla collina.
  [[Continua... => G2R2]]

:: G2R2 [HUB]
  # **IL SALE IMPURO – Maturità**
  set round = 5
  if $hub != "G2R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Andate a **pagina 19** della Village Chronicle, sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}).
  set hub = "G2R2"
  include Traguardi
  include VociSale
  if !$evFesta:
    block hubTitle:
      ! {icon:Storybook} **La festa di Lady Carew – Town Hall**
    block hubDetails:
      ! La festa per il nuovo padiglione si tiene nel salone del municipio. Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G2Festa]]
  if !$evTeatro:
    block hubTitle:
      ! {icon:Storybook} **Il dottore e il suo doppio – Traveling Caravan**
    block hubDetails:
      ! Una compagnia di attori ha montato il tendone accanto alla carovana. Il primo giocatore che manda un suo pezzo alla Traveling Caravan [[clicca qui. -> G2Teatro]]
  if !$evBecchino:
    block hubTitle:
      ! {icon:Storybook} **Una fossa già pagata – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G2Becchino]]
  if !$evChiave2 && $chiave != "":
    block hubTitle:
      ! {icon:Storybook} **La chiave che tira – nella Tenuta**
    block hubDetails:
      ! La chiave dell'apprendista è ancora in famiglia, in un cassetto. Quando il tuo Scienziato fa un'azione nella Tenuta, puoi prenderla: [[clicca qui. -> G2Chiave]]
  if !$evPadiglione:
    block hubTitle:
      ! {icon:Storybook} **Il nuovo padiglione – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G2Padiglione]]
  if !$evLibro:
    block hubTitle:
      ! {icon:Storybook} **Un libro in biblioteca – Library**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Library [[clicca qui. -> G2Libro]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > Lady Carew, con i capelli bianchi e la voce di sempre, dà una festa per il nuovo padiglione del manicomio. Tutta la città è invitata, anche la famiglia della tenuta: soprattutto la famiglia della tenuta.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G2R2" next="G2Carew"

::round G2R2 5
fine: La Maturità della Seconda Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Vecchiaia prima di continuare.

:: G2Festa
  set evFesta = true
  # **La festa di Lady Carew**
  > Il salone del municipio è pieno di fiori, di candele e di gente per bene. Lady Carew riceve gli ospiti all'ingresso, seduta, con il libretto rilegato in pelle sulle ginocchia, come trent'anni fa.
  if $carew > 0:
    > Quando ti vede ti tende la mano e ti ricorda, con un sorriso, che il nome della tua famiglia è ancora sulla targa d'ottone all'ingresso del manicomio. "Le famiglie generose", dice, "non si dimenticano."
  elif $carew < 0:
    > Quando ti vede non ti tende la mano. "Ah", dice, abbastanza forte perché la sentano tutti. "La famiglia che non ha bisogno di manicomi." Qualcuno ride. Tu no.
  else:
    > Quando ti vede ti saluta con un cenno, come si saluta una famiglia di cui si sa tutto, e ti indica il buffet.
  ! Che cosa fai?
  [[Le chiedi chi paga il nuovo padiglione. ~> chiedi]]
  [[Balli, bevi e ti fai vedere in giro. ~> balla]]
  [[Le rubi il libretto rilegato in pelle. ~> ruba]]
  fragment chiedi:
    set carewParla = true
    set sospetto = $sospetto + 1
    > Lady Carew smette di sorridere. Si guarda intorno, chiude il libretto e ti fa cenno di chinarti. "Non qui", sussurra. "Domani, dopo la festa, venite da me. Vi dirò tutto. E voi, in cambio, mi direte una cosa sola: un nome." Mezzo salone vi ha visto parlare a bassa voce, e l'altra metà se lo farà raccontare.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon}.
  fragment balla:
    > Balli il valzer con la moglie del sindaco, bevi lo champagne del manicomio e racconti barzellette al direttore della banca. Per una sera la famiglia della tenuta è una famiglia come le altre, e tutti sembrano sollevati di poterlo credere.
    block setupEvent next=$hub:
      ! Guadagni 1VP e arretra di 1 casella sul tracciato {icon:Creepy_Icon}.
  fragment ruba:
    set registroCarew = true
    set sospetto = $sospetto + 1
    > Quando Lady Carew si alza per il discorso, il libretto resta sulla poltrona. Lo infili sotto la giacca e te ne vai dalla porta di servizio. A casa lo leggi tutto: nomi, diagnosi, *casi interessanti*, e i conti del reparto dei signori, pagati per anni da Umber. L'ultima riga, nella grafia minuta di Lady Carew, è di stamattina: *Domani. Il nome.*
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 1 Conoscenza Biologica (Biology Knowledge).

:: G2Becchino
  set evBecchino = true
  # **Una fossa già pagata**
  > Il becchino del cimitero nuovo è un uomo allegro, che fischietta mentre scava. Sta preparando una fossa in un angolo tranquillo, vicino al muro di cinta, sotto un tiglio. È per un cliente che non è ancora morto, ti spiega: ha pagato tutto in anticipo, la fossa, la lapide, perfino i fiori, che dovranno essere violette. Con un assegno.
  ! Che cosa fai?
  [[Paghi $1 per vedere l'ordine. ~> ordine]]
  [[Gli chiedi di scavarne un'altra, per te. ~> altra]]
  fragment ordine:
    > Il becchino tira fuori dal panciotto un foglio sgualcito. L'ordine è firmato *Umber*, nella grafia di sempre. Nello spazio della lapide c'è scritto soltanto *Qui riposa chi ha tenuto la chiave*; lo spazio della data è vuoto. "Gente previdente", dice il becchino, e riprende a scavare.
    block setupEvent next=$hub:
      ! Paga $1. Guadagni 1 {icon:Insanity_Icon} e 1VP.
  fragment altra:
    > Il becchino ride di cuore, poi si accorge che non stai scherzando. Ti mostra un angolo libero, al sole, lontano dal muro, e ti fa un buon prezzo. Firmi l'ordine con la tua grafia, quella diritta, e provi uno strano sollievo: almeno questo, nella tua vita, sarà al suo posto.
    block setupEvent next=$hub:
      ! Paga $2. Arretra di 2 caselle sul tracciato {icon:Insanity_Icon}.

:: G2Padiglione
  set evPadiglione = true
  # **Il nuovo padiglione**
  > L'architetto del nuovo padiglione del manicomio ha i disegni appesi alle pareti del Builder's Office, come quadri. Ti fa vedere tutto con orgoglio: i corridoi luminosi, le camere singole, il giardino d'inverno. Nell'angolo più lontano, dove il padiglione tocca il vicolo, c'è una porticina di servizio che nei disegni ufficiali non compare.
  ! Che cosa fai?
  [[Chiedi chi ha voluto la porticina. ~> porta]]
  [[Paghi $2 per una copia dei disegni. ~> disegni]]
  fragment porta:
    > L'architetto arrossisce. "Lady Carew in persona", dice. "Una porta riservata, per le visite discrete. Ne ha una copia della chiave soltanto lei." Poi abbassa la voce: "E un signore che viene a trovarla la sera tardi. Un benefattore. Piccolo di statura."
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1VP.
  fragment disegni:
    > L'architetto ti fa copiare i disegni da un apprendista, e li firma per autenticità. A casa li studi per una notte intera. Il padiglione è costruito bene: ha soltanto una debolezza, e la debolezza è la porticina sul vicolo.
    block setupEvent next=$hub:
      ! Paga $2. Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge) e 1 {icon:Gears_Icon}.

:: G2Teatro
  set evTeatro = true
  # **Il dottore e il suo doppio**
  > Sul tendone della compagnia c'è un manifesto dipinto a mano: *IL DOTTORE E IL SUO DOPPIO – dramma in tre atti, tratto da una storia vera.* Il dottore è alto e distinto, e beve un sale bianco da un bicchiere che fuma. Il doppio è piccolo, con un cappotto nero troppo largo, e ride.

  > Il pubblico ride con lui. Ogni tanto, nel buio, qualcuno si volta a guardare dalla tua parte.
  ! Che cosa fai?
  [[Paghi $3 al capocomico perché smonti il tendone. ~> paga]]
  [[Resti fino alla fine. ~> resta]]
  [[Sali sul palco. ~> palco]]
  fragment paga:
    set sospetto = $sospetto - 1
    > Il capocomico prende il denaro con un inchino e la mattina dopo il tendone non c'è più. I manifesti, però, restano incollati ai muri per mesi, sbiaditi dalla pioggia, e il piccolo uomo dipinto continua a ridere da ogni angolo.
    block setupEvent next=$hub:
      ! Paga $3.
  fragment resta:
    > Nel terzo atto il dottore insegue il doppio sui tetti, lo raggiunge e gli strappa il cappello: sotto c'è la faccia di suo figlio. Applausi. Agli inchini, gli attori sono sei; sul programma ce n'erano cinque. Quello che faceva il doppio non è sul programma, e quando cerchi il camerino dietro il tendone non lo trovi.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment palco:
    > Sali sul palco a metà del secondo atto, ti metti in mezzo agli attori e dici al pubblico che è tutto vero. Il pubblico applaude l'improvvisazione. Il capocomico, dopo lo spettacolo, ti offre una parte fissa.
    block setupEvent next=$hub:
      ! Guadagni 2VP e 1 {icon:Creepy_Icon}.

:: G2Libro
  set evLibro = true
  # **Un libro in biblioteca**
  > Nella biblioteca nuova, sullo scaffale delle scienze naturali, c'è l'unico libro che il vecchio abbia mai pubblicato: *Saggio sulla duplice natura dell'uomo*, 1858. È consumato dall'uso. I margini sono fitti di appunti a matita, in una grafia minuta che pende all'indietro: correzioni, calcoli, punti esclamativi.

  > Sulla scheda dei prestiti, incollata in fondo al libro, c'è sempre lo stesso nome, ogni mese, da vent'anni: *Studio notarile Pell*. Le ultime date sono successive alla morte di Silas.
  ! Che cosa fai?
  [[Prendi in prestito il libro. ~> prestito]]
  [[Rimetti il libro sullo scaffale. ~> lascia]]
  fragment prestito:
    set libro = true
    > Lo porti alla tenuta e lo leggi in una notte. Il saggio è noioso, presuntuoso e geniale, come il suo autore. Gli appunti a margine sono meglio del saggio. Qualcuno, in tutti questi anni, ha continuato il lavoro del vecchio. Il giorno dopo, in biblioteca, ti cercano: il libro era prenotato.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge).
  fragment lascia:
    > Rimetti il libro al suo posto, con il dorso allineato agli altri. Quando torni, una settimana dopo, non c'è più. La bibliotecaria dice che l'ha preso il solito signore dello studio notarile. Le sembra strano che te ne interessi.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Carew
  set sospetto = $sospetto + 2
  # **L'omicidio di Lady Carew**
  ! **Gazzetta di {$townname} – *1888.***
  > **ORRIBILE DELITTO DIETRO IL MANICOMIO.** Lady Carew, benefattrice della città e fondatrice del manicomio sulla collina, è stata trovata morta all'alba nel vicolo che costeggia il nuovo padiglione, dove si era allontanata, pare, per prendere un po' d'aria dopo la festa. È stata colpita più volte con un bastone da passeggio, con una furia che il medico legale non ha esitato a definire "disumana".

  > Una cameriera, affacciata a una finestra dell'ultimo piano, ha visto l'aggressore nella nebbia: un uomo piccolo, con un cappotto nero troppo largo, che dopo il delitto si è allontanato senza fretta, fischiettando. Accanto al corpo la polizia ha trovato metà del bastone, spezzato. Sull'impugnatura d'argento ci sono le iniziali della famiglia della tenuta.

  > La città vuole un colpevole. L'Ispettore Ada Haskett ha promesso di trovarlo prima di Natale.
  if $carewParla:
    > Lady Carew aveva promesso a uno di voi di dirgli tutto, il giorno dopo la festa. Non ha fatto in tempo. Mezzo salone vi ha visto parlare con lei a bassa voce, e Ada Haskett lo sa.
  if $registroCarew:
    > In famiglia qualcuno ricorda il libretto rilegato in pelle di Lady Carew, e la pagina dei conti del reparto dei signori: un assegno al mese, per anni, firmato *Umber*. Chi paga per tanto tempo, prima o poi, smette di pagare. O comincia a chiedere qualcosa in cambio.
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G2Funerale:
      ! Il segnalino {icon:AngryMob_Icon} avanza di 2 caselle.

:: G2Funerale
  # **Il funerale di Lady Carew**
  > Il funerale di Lady Carew è il più grande che la città abbia mai visto: il vescovo, il sindaco, tutti i medici del manicomio in fila, e dietro mezza città in nero. Il corteo passa davanti al cancello della tenuta. La famiglia deve decidere se unirsi al corteo, o restare in casa, con le tende tirate.
  ! Che cosa fate? *(Decidete insieme.)*
  [[Andate al funerale, in prima fila. ~> prima]]
  [[Mandate una corona di fiori, e restate a casa. ~> corona]]
  [[Restate a casa, e basta. ~> casa]]
  fragment prima:
    if $carew > 0:
      set sospetto = $sospetto - 2
      > Il vescovo vi accoglie con una stretta di mano: la vostra famiglia è sulla targa d'ottone del manicomio, e tutti lo sanno. Durante l'orazione qualcuno vi guarda storto, ma nessuno osa dire niente.
    else:
      set sospetto = $sospetto + 1
      > Vi fate largo fino alla prima fila. La folla mormora. Una donna, a voce abbastanza alta perché la sentano tutti, dice che l'assassino torna sempre sul luogo del delitto, o almeno al funerale.
    block setupEvent next=G2Cronaca2:
      ! Non succede niente.
  fragment corona:
    set sospetto = $sospetto - 1
    > La corona è la più grande del corteo, bianca e viola, con un nastro e il nome della famiglia in lettere d'oro. La Gazzetta la descrive con ammirazione. Pagarla è costato parecchio.
    block setupEvent next=G2Cronaca2:
      ! Ogni giocatore paga $1.
  fragment casa:
    set sospetto = $sospetto + 1
    > Restate a casa, con le tende tirate, mentre il corteo passa davanti al cancello. Qualcuno, dalla strada, lancia un sasso contro una finestra del piano terra. Il vetro si rompe. Nessuno di voi scende a raccoglierlo.
    block setupEvent next=G2Cronaca2:
      ! Ogni giocatore guadagna 1 {icon:Creepy_Icon}.

:: G2Cronaca2
  # **Il diario di Ada Haskett**
  ! **Dal diario dell'Ispettore Ada Haskett – *dicembre 1888.***
  > Lady Carew è morta da tre mesi e non ho niente in mano. Un bastone spezzato con le iniziali di una famiglia, una cameriera che ha visto un uomo piccolo nella nebbia, e una città che vuole un colpevole entro Natale. La zia dice che il colpevole c'è sempre: il problema è che di solito non è uno solo.
  if $carewParla:
    > Mezzo salone, la sera della festa, ha visto Lady Carew parlare a bassa voce con qualcuno della tenuta. Lei aveva promesso di dirgli un nome, il giorno dopo. È morta prima. Non so se chi le ha parlato sia un testimone o un complice. So che è una persona che ha paura.
  if $registroCarew:
    > Il libretto rilegato in pelle di Lady Carew, quello che non lasciava mai, non è stato trovato né sul corpo né in casa sua. Qualcuno l'ha preso. Ho una mezza idea di chi.
  if $evTeatro:
    > In città si parla ancora del *Dottore e il suo doppio*, la commedia della carovana, e c'è chi va a cercare l'assassino di Lady Carew tra gli attori, come si va al circo. Ho chiesto al capocomico chi faceva il doppio. Non lo sa. Non lo ha mai saputo.
  if $libro:
    > Uno degli eredi ha preso in prestito il libro del vecchio dalla biblioteca, quello prenotato ogni mese dallo studio Pell. Il giorno dopo il commesso del notaio è venuto a chiederlo indietro, con un'insistenza che mi è sembrata strana. Ho preso nota.
  if $evBecchino:
    > Il becchino del cimitero nuovo dice di aver ricevuto, mesi fa, l'ordine per una fossa intestata a un vivo, pagata con un assegno di Umber, senza data. Gli ho chiesto di non riempirla. Ha riso.
  > Domani ricomincio da capo, dalla tenuta. La zia dice che è lì che si finisce sempre.
  [[Continua... => G2R3]]

:: G2R3 [HUB]
  # **IL SALE IMPURO – Vecchiaia**
  set round = 6
  if $hub != "G2R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $umber == "braccato":
        ! Andate a **pagina 19** della Village Chronicle, sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}): la città è sorvegliata, ma non chiusa.
      else:
        ! Andate a **pagina 21** della Village Chronicle, sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}): il coprifuoco.
  set hub = "G2R3"
  include Traguardi
  include VociSale
  if !$evEzra:
    block hubTitle:
      ! {icon:Storybook} **Il notaio giovane – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G2Ezra]]
  if !$evLomax2:
    block hubTitle:
      ! {icon:Storybook} **Il vecchio farmacista – General Store**
    block hubDetails:
      ! Lomax ha chiuso la farmacia, ma vende ancora i suoi sali al banco del General Store. Il primo giocatore che ci manda un suo pezzo [[clicca qui. -> G2Lomax]]
  if !$evRicatto:
    block hubTitle:
      ! {icon:Storybook} **Una lettera anonima – Bank**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Bank [[clicca qui. -> G2Ricatto]]
  if !$evBastone:
    block hubTitle:
      ! {icon:Storybook} **L'impugnatura d'argento – Foundry**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Foundry [[clicca qui. -> G2Bastone]]
  if !$evChiesa:
    block hubTitle:
      ! {icon:Storybook} **Il confessionale – Church**
    block hubDetails:
      ! Durante il coprifuoco la chiesa resta aperta tutta la notte. Il primo giocatore che ci manda un suo pezzo [[clicca qui. -> G2Chiesa]]
  block hubTitle:
    ! **Fine della Generazione**
  block hubDetails:
    > Natale è passato da un pezzo, e il colpevole non c'è. Ada Haskett ha smesso di cercare per strada: adesso cerca alla tenuta.
  [[Clicca qui alla Fine della Generazione per continuare... ~> 0]]
  fragment 0:
    ui endOfRound progress="G2R3" next="G2Accusa"

::round G2R3 0
fine: La Vecchiaia della Seconda Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook prima della Fine della Generazione.

:: G2Ricatto
  set evRicatto = true
  # **Una lettera anonima**
  > Alla Bank ti aspetta una lettera, lasciata allo sportello da un ragazzo che è scappato via subito. Dentro, ritagliate dai giornali, lettere di ogni misura compongono una sola frase: *SO CHI DI VOI ESCE DI NOTTE. LASCIATE IL DENARO NELLA CASSETTA DI SICUREZZA 14, O LO SAPRÀ ANCHE L'ISPETTORE.* La cassetta 14, dice il cassiere, è intestata allo studio notarile Pell, che però non la usa da anni.
  ! Che cosa fai?
  [[Paghi, e non ne parli con nessuno ($3). ~> paga]]
  [[Porti la lettera ad Ada Haskett. ~> ada]]
  [[La strappi. ~> strappa]]
  fragment paga:
    > Lasci il denaro nella cassetta 14, in una busta senza nome. Una settimana dopo torni a controllare: la busta non c'è più, e al suo posto c'è un biglietto scritto a mano, nella grafia che pende all'indietro: *Grazie. Ne terrò conto.*
    block setupEvent next=$hub:
      ! Paga $3.
  fragment ada:
    set ada = $ada + 1
    > Ada legge la lettera, la gira, la annusa e la chiude in una busta della polizia. Fa aprire la cassetta 14 con un mandato: dentro c'è soltanto polvere, e un vecchio astuccio da penne vuoto. "Qualcuno sapeva che sareste venuti da me", dice. "Oppure sperava che non ci veniste."
    block setupEvent next=$hub:
      ! Guadagni 1VP. L'Ispettore Ada Haskett si ricorderà della tua famiglia.
  fragment strappa:
    set sospetto = $sospetto + 2
    > La strappi in otto pezzi e la butti nel cestino della banca. Due giorni dopo, nella rubrica dei pettegolezzi della Gazzetta, compare un indovinello in versi su una famiglia "che di notte esce e di giorno strappa la posta". La città ride per una settimana.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon}.

:: G2Bastone
  set evBastone = true
  # **L'impugnatura d'argento**
  > Il caposquadra della fonderia è un omone con le braccia segnate dalle scottature e una memoria da archivista. Quando gli descrivi l'impugnatura d'argento del bastone trovato accanto a Lady Carew, annuisce subito. "L'abbiamo fusa noi", dice. "Quarant'anni fa, per il vecchio della tenuta. Un pezzo unico. Quel bastone, il vecchio, lo portava sempre."
  ! Che cosa fai?
  [[Gli chiedi di testimoniare che il bastone non è più vostro da trent'anni ($2). ~> testimonia]]
  [[Gli chiedi se ne ha fusa una copia. ~> copia]]
  fragment testimonia:
    set bastone = true
    > Il caposquadra ci pensa a lungo. Poi accetta, per un piccolo compenso e per amore della verità, in quest'ordine. Davanti all'Ispettore Haskett giurerà che il bastone apparteneva al vecchio, scomparso da quasi trent'anni, e che nessuno della famiglia lo ha mai più visto.
    block setupEvent next=$hub:
      ! Paga $2. Il caposquadra testimonierà per la famiglia.
  fragment copia:
    > "Una copia no", dice il caposquadra. "Ma tre anni fa è venuto un signore a farcela lucidare, l'impugnatura. Con il bastone intero. Un signore piccolo, con un cappotto nero troppo largo. Ha pagato con un assegno." Ride. "L'assegno era buono."
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 1 {icon:Gears_Icon}.

:: G2Ezra
  set evEzra = true
  # **Il notaio giovane**
  > Sulla tomba di Silas Pell c'è una lapide nuova, di marmo bianco, troppo grande per un uomo che non amava farsi notare. Davanti c'è suo figlio, il notaio Ezra Pell: magro, vestito di nero, con gli occhi di chi dorme poco. Ti saluta con un inchino, come si saluta un cliente. Il notaio della vostra famiglia, adesso, è lui, e il fascicolo l'ha letto tutto.

  > "Mio padre vi voleva bene", dice. "A modo suo."
  if $silas:
    > Poi, dopo un momento: "Negli ultimi anni, però, aveva paura di voi. Di uno di voi, almeno. Non mi ha mai detto perché."
  ! Che cosa fai?
  [[Gli racconti del sale e degli assegni. ~> racconta]]
  [[Gli chiedi della credenza di suo padre. ~> credenza]]
  [[Lasci un fiore sulla tomba di Silas, e te ne vai. ~> fiore]]
  fragment racconta:
    set ezra = $ezra + 1
    > Ezra ascolta senza interromperti, con un'attenzione strana, quasi affamata: ti chiede il colore del sale nel bicchiere, quante sorsate, quante ore dura. Alla fine ti ringrazia, ti stringe la mano e ti offre di custodire nel suo studio i documenti della famiglia, "al sicuro, sotto chiave". Ha le dita fredde.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Il notaio Ezra Pell si ricorderà della tua famiglia.
  fragment credenza:
    > Ezra ride, una risata breve e nervosa. "La credenza! Non ho mai trovato la chiave. Ho fatto venire due fabbri, e nessuno dei due è riuscito ad aprirla. Mio padre teneva lì le sue polveri, quando era giovane e voleva fare lo speziale." Si accarezza il panciotto, dove un tempo suo padre teneva la bustina. "Se la apro, sarete i primi a saperlo."
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon}.
  fragment fiore:
    set ezra = $ezra + 1
    > Lasci sulla lapide un mazzetto di violette. Ezra lo guarda e impallidisce. "Le violette", dice. "Le portava qualcuno anche a vostro nonno, ogni mattina. Mio padre me lo raccontava." Poi si ricompone, ti ringrazia e ti accompagna al cancello.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Creepy_Icon}. Il notaio Ezra Pell si ricorderà della tua famiglia.

:: G2Lomax
  set evLomax2 = true
  # **Il vecchio farmacista**
  > Lomax è invecchiato, ormai. Ha chiuso la farmacia e vende i suoi sali a un banco in fondo al General Store, tra le scope e le lampade a petrolio. Ha le dita ancora macchiate di giallo, e la stessa aria di chi aspetta una cattiva notizia: la differenza è che adesso sembra sapere quale.
  if $lomax == "minacciato":
    > Ti riconosce subito: sei della famiglia che lo prese per il bavero al mercato, tanti anni fa. Non ti rivolge la parola.
  elif $lomax == "registro":
    > Ti riconosce subito. "Avete ancora la mia pagina?", chiede a bassa voce. "Tenetela cara. Un giorno vi servirà."
  ! Che cosa fai?
  [[Compri una boccetta del suo sale ($1). ~> compra]]
  [[Gli chiedi che cosa c'era nella prima partita. ~> riga]]
  fragment compra:
    > Lomax te la incarta con le mani che tremano. "È il migliore", dice. "È puro. È questo il guaio." Quella sera, nel bicchiere, il colore si arresta al primo rosso, come sempre.
    block setupEvent next=$hub:
      ! Paga $1. Guadagni 1 {icon:Chemical_Icon} e 1VP.
  fragment riga:
    if $lomax == "minacciato":
      set sospetto = $sospetto + 1
      > Lomax chiama il padrone del negozio con un filo di voce. Il padrone ti accompagna alla porta, gentilmente, davanti a tutti i clienti. Sul marciapiede, una signora ti riconosce e si fa il segno della croce.
      block setupEvent next=$hub:
        ! Guadagni 1 {icon:Creepy_Icon}.
    else:
      set polvere = true
      > Lomax si guarda intorno, poi si china verso di te. Ha l'alito che sa di menta e di paura. "Grigia", sussurra. "Era grigia, la polvere. Un cucchiaino per boccetta. Non chiedetemi di chi era." Poi torna a contare le sue scatole, e non dice altro.
      block setupEvent next=$hub:
        ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge) e 1 {icon:Insanity_Icon}.

// Il confessionale: una pagina segreta.
:: G2Chiesa
  set evChiesa = true
  @@ **Questa pagina è segreta: non mostrarla agli altri.**
  # **Il confessionale**
  > La chiesa è piena di gente che non vuole dormire a casa: famiglie intere sui banchi, con le coperte e le lanterne, a pregare sottovoce. Il confessionale è in fondo, al buio. Ti inginocchi. Dietro la grata una voce stanca ti dice: "Parla pure."
  ! Che cosa fai?
  [[Confessi di aver bevuto il sale. ~> sale]]
  [[Confessi qualcosa che non hai fatto. ~> falso]]
  [[Non dici niente, e ascolti. ~> ascolta]]
  fragment sale:
    > Racconti tutto, anche quello che non ricordi. Il prete tace a lungo. Poi, a voce bassissima: "Anche l'altro è venuto qui, ieri notte. Ha confessato le stesse cose, nello stesso ordine. Con la tua voce." Quando esci dal confessionale, l'altra metà della grata è vuota.
    block setupEvent next=$hub:
      ! Arretra di 2 caselle sul tracciato {icon:Insanity_Icon} e guadagni 1 {icon:Creepy_Icon}.
  fragment falso:
    > Confessi un peccato inventato, piccolo e plausibile, per vedere che cosa succede. "Bugiardo", dice la voce dietro la grata, e ride. Non è la voce del prete. Quando apri la tendina, il prete sta arrivando adesso dalla sacrestia, con la stola in mano, a chiederti scusa per il ritardo.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment ascolta:
    > Non dici niente. Dall'altra parte della grata qualcuno respira piano, a lungo, poi si alza e se ne va. Sul gradino del confessionale trovi un assegno piegato in quattro, al portatore, con la grafia che pende all'indietro. È un'elemosina. Per te.
    block setupEvent next=$hub:
      ! Guadagni $2.

:: G2Accusa
  # **Chi è Umber?**
  > L'Ispettore Ada Haskett si presenta alla tenuta una sera d'inverno, da sola, con il bastone spezzato avvolto in un fazzoletto. Si siede in biblioteca senza togliersi il cappotto e lo posa sul tavolo, tra voi.

  > "Non credo ai fantasmi", dice, "e nemmeno agli uomini che non invecchiano. Credo alle iniziali sulle impugnature e alle scarpe sporche di fango. Umber è in questa stanza. Me lo dite voi, oppure lo scelgo io."
  if $bastone:
    set sospetto = $sospetto - 1
    > Sul tavolo, accanto al bastone, c'è anche la deposizione del caposquadra della fonderia: il bastone era del vecchio, e nessuno della famiglia lo vedeva da quasi trent'anni. Ada la tocca con un dito, come per vedere se scotta.
  if $ada > 0:
    > Poi aggiunge, più piano: "Mi avete aiutata, e non lo dimentico. Se vi sbagliate, non sarò io a farvela pagare."
  elif $ada < 0:
    set sospetto = $sospetto + 1
    > Poi apre il fascicolo e posa sul tavolo, bene in vista, le monete che le avete dato. "Queste", dice, "sono già agli atti."
  if $players == 2:
    ui specialEvent
    ! Ogni giocatore prende in mano in segreto quanto denaro vuole offrire all'Ispettore *per chiudere l'indagine senza un nome*, anche niente. Quando tutti sono pronti, rivelate insieme le offerte.
    [[Clicca per iniziare l'offerta... ~> offerta]]
  else:
    ui specialEvent
    ! Ogni giocatore indica in segreto un altro giocatore (un dito sul tavolo, al tre). Chi riceve più indicazioni è l'accusato *(in caso di parità, il Primo Giocatore sceglie tra i pari)*.
    [[Clicca quando avete scelto l'accusato... -> G2AccusaChi]]
  fragment offerta:
    ui bidding next="G2Offerta" mode="Bidding"

:: G2Offerta
  # **L'offerta**
  if $ada > 0:
    set soglia = $players - 1
  else:
    set soglia = $players
  ! L'offerta totale è di almeno ${$soglia}?
  [[Sì: l'Ispettore chiude l'indagine. ~> chiusa]]
  [[No: l'Ispettore sceglie da sola. -> G2AccusaChi]]
  fragment chiusa:
    set accusato = "nessuno"
    goto G2Verdetto

:: G2AccusaChi
  # **L'accusato**
  ! Chi viene accusato?
  [[{$nameA} ~> a]]
  [[{$nameB} ~> b]]
  if $players > 2:
    [[{$nameC} ~> c]]
  if $players > 3:
    [[{$nameD} ~> d]]
  fragment a:
    set accusato = "A"
    goto G2Verdetto
  fragment b:
    set accusato = "B"
    goto G2Verdetto
  fragment c:
    set accusato = "C"
    goto G2Verdetto
  fragment d:
    set accusato = "D"
    goto G2Verdetto

:: G2Verdetto
  # **Il verdetto**
  if $accusato == "nessuno":
    > Ada Haskett conta il denaro due volte, lo infila in una busta e scrive sulla busta: *per le vedove della polizia*. Poi chiude il fascicolo, si alza e se ne va senza salutare. Il giorno dopo la Gazzetta scrive che l'assassino di Lady Carew era un vagabondo, morto annegato nel fiume.

    > In città nessuno ci crede. Si dice che la famiglia della tenuta abbia comprato il silenzio della polizia; e la gente, quando non può avere un colpevole, si accontenta volentieri di un sospetto.
    block setupEvent next=G2Boccette:
      ! Le offerte vanno nella riserva. Il segnalino {icon:AngryMob_Icon} avanza di 1 casella.
  elif $accusato == $ombra:
    set umber = "preso"
    set sospetto = $sospetto - 3
    > Le guardie perquisiscono la camera dell'accusato. Nell'armadio trovano le scarpe sporche di fango del fiume; nella tasca di un cappotto nero troppo stretto, un mazzo di assegni firmati; sotto il materasso, l'altra metà del bastone. La grafia degli assegni pende all'indietro.

    > Al processo l'accusato giura di non ricordare niente, e tutti, in aula, ridono. Tutti tranne Ada Haskett, che lo guarda a lungo, come si guarda qualcuno che dice la verità. Quella notte, per la prima volta da trent'anni, nessuno vede Umber in città.
    block setupEvent next=G2Boccette:
      set _SetupImage = "MaladjustmentBack"
      ! **L'accusato era l'Erede nell'Ombra.** Perde 5VP e prende il Maladjustment **Loose Lips** messo da parte. Gli altri giocatori guadagnano 2VP.
  elif $ada > 0:
    set sospetto = $sospetto + 2
    > Le guardie perquisiscono la camera dell'accusato e non trovano niente: né scarpe infangate, né assegni, né l'altra metà del bastone. Ada Haskett lo porta via lo stesso, perché la città lo vuole; ma la mattina dopo lo rilascia per mancanza di prove, e alla Gazzetta dice che l'indagine continua.

    > Quella notte, mentre la famiglia festeggia il ritorno dell'accusato, in fondo al vicolo qualcuno ride.
    block setupEvent next=G2Boccette:
      ! **L'accusato era innocente.** Guadagna 3VP per il torto subito.
  else:
    set arrestato = true
    set sospetto = $sospetto + 3
    > Le guardie perquisiscono la camera dell'accusato e non trovano niente: né scarpe infangate, né assegni, né l'altra metà del bastone. Lo portano via lo stesso, perché la città vuole un colpevole e Natale è passato da un pezzo. La Jail ha una cella libera, con la finestra sul vicolo.

    > Quella notte, mentre l'accusato guarda le stelle tra le sbarre, in fondo al vicolo qualcuno ride.
    block setupEvent next=G2Boccette:
      ! **L'accusato era innocente.** Guadagna 3VP per il torto subito.

:: G2Boccette
  # **Le boccette vuote**
  > Le sei boccette del vecchio sono vuote: qualcuno, in famiglia, ha bevuto o buttato l'ultimo granello, e nessuno ammette di essere stato. Sono ancora nella cassetta di zinco, sotto la tavola smossa accanto alla stufa, con la ceralacca rotta e le etichette scolorite: *Farmacia Lomax – prima partita*. Sul fondo di vetro resta una patina grigiastra, che non va via nemmeno con l'acqua bollente.
  ! Che cosa fate delle boccette? *(Decidete insieme.)*
  [[Le conservate nel laboratorio. ~> tieni]]
  [[Le affidate al notaio Ezra Pell. ~> notaio]]
  [[Le buttate nel fiume. ~> fiume]]
  fragment tieni:
    set boccette = "tenute"
    > Le rimettete nella cassetta di zinco, e la cassetta sotto la tavola. Nessuno sa a che cosa possano servire delle boccette vuote. Nessuno se la sente di buttarle.
    block setupEvent next=G2Chiusura:
      ! Non succede niente.
  fragment notaio:
    set boccette = "notaio"
    set ezra = $ezra + 1
    > Ezra Pell le riceve nel suo studio, le esamina una per una contro la luce della finestra e le chiude in un armadio a vetri, con una cura che vi commuove. "Saranno al sicuro", dice. "Più al sicuro che da voi."
    block setupEvent next=G2Chiusura:
      ! Ogni giocatore guadagna 1VP.
  fragment fiume:
    set boccette = "fiume"
    set sospetto = $sospetto - 1
    > Le buttate dal ponte, una alla volta, in una notte senza luna. Il fiume le inghiotte senza rumore. Una settimana dopo un pescatore ne ripesca una, e la vende al rigattiere come ricordo del vecchio della tenuta.
    block setupEvent next=G2Chiusura:
      ! Non succede niente.

:: G2Chiusura
  set sale = 0
  # **Fine della Generazione**
  > Il farmacista Lomax, ormai vecchio, vende ancora il sale: bianco, fine, con l'etichetta nuova e il prezzo di una volta. Ma nel bicchiere il colore non cambia più come prima. Diventa rosso e si ferma lì. Quando gli chiedono perché, il vecchio Lomax guarda per terra e dice che il sale di oggi è troppo puro.
  ! **Nota del notaio Ezra Pell.**
  > Nell'inverno del 1895 morì, in una camera d'affitto vicino al fiume, un vecchio senza documenti, piccolo, magro, con un cappotto nero troppo largo. Lo seppellirono nella fossa comune. Al funerale c'ero soltanto io: avevo letto il fascicolo, e sapevo chi era.

  > Quello stesso inverno, frugando tra le carte di mio padre, trovai finalmente la chiave della credenza: era cucita nella fodera del suo cappotto. Non scrivo qui che cosa ci trovai dentro. Scrivo soltanto che da allora dormo poco, e che la credenza, adesso, è vuota.
  if $ezra > 0:
    > Non lo dissi alla famiglia della tenuta, anche se le avevo promesso che sarebbe stata la prima a saperlo. Avevano avuto fiducia in me. È stato l'errore peggiore della loro vita, e il più utile della mia.
  ui endOfGeneration generation=6 text: Rimuovete tutti i pezzi dal tabellone ed eseguite la Fine della Generazione. Rimettete nella riserva i token {icon:StorybookToken} non usati. Gli Avvistamenti {icon:S2_HuntTokenFRONT} sul tabellone tornano accanto al tabellone; i Money token tornano ai giocatori.
  [[Clicca per continuare... => SaleG3Intro]]
