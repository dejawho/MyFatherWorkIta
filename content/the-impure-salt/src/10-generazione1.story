// Prima Generazione – "La porta sul vicolo" (1861–1879).
// Luoghi delle pagine della Chronicle: FotU 4 e 5 (Builder's Office, Cemetery, Fortune Teller,
// Town Hall, Farmer's Bazaar, Blacksmith's Apprentice); ATOW 21 (il Blacksmith con il simbolo
// dello Storybook, la Traveling Caravan) o FotU 6 (l'Asylum Program con il simbolo).

:: SaleG1Intro [INTRO voice]
  # **GENERAZIONE I: La porta sul vicolo**
  ! **Verbale della lettura del testamento – notaio Silas Pell, *marzo 1861.***
  > Gli eredi si sono riuniti nella biblioteca della tenuta il giorno dopo la sepoltura, alle cinque del pomeriggio. Le tende erano tirate, come sempre in quella casa; il caminetto era spento, e nessuno ha chiesto di accenderlo. Il sottoscritto ha rotto i sigilli in presenza di tutti e ha dato lettura del documento, scritto di pugno dal defunto due anni or sono.

  > La tenuta, con il laboratorio, gli strumenti, gli animali e i debiti, va in parti uguali ai figli. Il Journal va a chi saprà leggerlo. Fin qui, niente di strano.

  > Segue una clausola, che il sottoscritto ha dovuto leggere due volte, a richiesta dei presenti: *"Se io dovessi sparire senza spiegazione, o morire in circostanze che il mio notaio giudichi dubbie, tutto il resto dei miei beni, il denaro in banca, le azioni e la chiave dello studio sul vicolo, vada al mio amico Mr. Umber, che saprà farne buon uso."*

  > Nessuno dei presenti conosce un Mr. Umber. Nessuno sapeva che il defunto avesse un amico. Nessuno, a dire il vero, sapeva che la tenuta avesse uno studio sul vicolo.

  > Il sottoscritto annota che il defunto è morto nel suo letto, di febbre, assistito dal medico condotto: le circostanze non sono dubbie. Il sottoscritto, tuttavia, non consegnerà niente a nessuno finché questo Mr. Umber non si presenterà nel suo studio, di persona e in pieno giorno.

  > Prima di congedarsi, il sottoscritto ha consegnato a ciascuno degli eredi una pagina del Journal, staccata e sigillata, con il suo nome scritto sopra dal defunto. Erano nel testamento anch'esse.
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G1JournalA:
      include AzzeraTraguardi
      include PosaTraguardi

// Ogni erede riceve in segreto una pagina diversa del Journal: gli indizi dei colpi di scena.
// Pagine di lunghezza simile: nessuno si tradisce dal tempo di lettura.
::for L in A B C D | Fine
:: G1Journal%L%
  if %L.n% > $players:
    goto G1JournalFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **Una pagina del Journal**
  ! **Con il tuo nome sopra, nella mano di tuo padre.**
  if %L.n% == 1:
    > *Sale di Lomax, la prima partita, e nessun'altra. Sciolto in un bicchiere d'acqua di pozzo: rosso, poi viola, poi verde. Una sola sorsata, a stomaco vuoto.*

    > *Ho provato con il sale di altre farmacie, e non succede niente. Ho provato con una seconda partita di Lomax, e non succede niente. Dev'esserci qualcosa, in quella prima partita, che non era scritto nell'ordine.*
  elif %L.n% == 2:
    > *Non sono io che esco di notte. Lo giuro su quello che ho di più caro. Eppure al mattino ho in tasca le sue chiavi, e lui ha le mie; ho ai piedi le sue scarpe, e sono della mia misura.*

    > A metà della riga successiva la scrittura cambia: si fa più piccola, più svelta, e si inclina all'indietro, come se la mano tirasse dall'altra parte. *Smettila di scrivere di me.*
  elif %L.n% == 3:
    > Una pagina di conti, fitta di cifre. A metà, sottolineato due volte: *Lomax, farmacista, al ponte: sei boccette, pagate in contanti.* La somma basterebbe a comprare la farmacia intera.

    > Sotto, a matita, più piccolo, come scritto in fretta: *S. P. sa. S. P. ha la chiave della credenza. Non dirgli niente, non ancora.*
  else:
    > Il disegno accurato di una porta di legno senza maniglia né serratura, con le misure dei cardini e un indirizzo: il vicolo dietro la tenuta. Sotto, una sola riga: *Si apre solo da dentro. Ricordatelo, quando sarò io dall'altra parte.*

    > Sul retro, macchiata di fango, c'è l'impronta di una scarpa: piccola, troppo piccola per un uomo adulto.
  ! Che cosa fai della pagina?
  [[La tieni per te, tra le tue carte. ~> tieni]]
  [[La leggi ad alta voce a tutti, a colazione. ~> leggi]]
  fragment tieni:
    > Pieghi la pagina in quattro e la infili tra le tue carte. È tua, dopotutto: c'è il tuo nome sopra, nella mano di tuo padre. Agli altri racconterai quello che vorrai, quando vorrai.
    block setupEvent next=G1Journal%L.next%:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge). Puoi raccontare agli altri quello che hai letto, tutto, in parte o per niente.
  fragment leggi:
    > La mattina dopo, a colazione, leggi la pagina ad alta voce, parola per parola, senza saltare niente. Gli altri ascoltano in silenzio, e qualcuno ti guarda con gratitudine. Qualcun altro, con sospetto: perché tanta generosità?
    block setupEvent next=G1Journal%L.next%:
      ! Leggi ad alta voce agli altri giocatori il testo in corsivo qui sopra. Guadagni 1VP.
::endfor

:: G1JournalFine
  # **Il mattino dopo**
  > A colazione si parla poco. Chi ha letto la propria pagina ad alta voce l'ha fatto in fretta, tra il caffè e il pane; gli altri l'hanno piegata e messa in tasca, e guardano le tasche degli altri. Il notaio Pell è ripartito all'alba senza salutare, e la sua carrozza ha lasciato sul vialetto due solchi profondi nel fango.

  > Dalle finestre della sala da pranzo si vede il villaggio di {$townname}: case a graticcio strette intorno alla piazza, il mercato, il ponte sul fiume. Sulla collina, dove fino all'anno scorso pascolavano le pecore, gli operai di Lady Carew hanno cominciato a scavare le fondamenta di un grande edificio di mattoni. Sarà un manicomio, dicono, il più moderno della contea. Lady Carew ha già fatto sapere che i posti saranno pochi, e riservati alle famiglie per bene.

  > Resta da decidere che cosa fare del laboratorio del padre: una stanza lunga e bassa in fondo alla casa, con le finestre annerite dal fumo, gli alambicchi ancora sporchi e un odore di acido che nessuna corrente d'aria riesce a portare via.
  ! Che cosa fate del laboratorio? *(Decidete insieme.)*
  [[Lo chiudete a chiave, così com'è. ~> chiudi]]
  [[Lo riaprite e ci lavorate. ~> lavora]]
  [[Vendete gli strumenti più preziosi. ~> vendi]]
  fragment chiudi:
    set sospetto = $sospetto - 1
    > Chiudete la porta a doppia mandata e appendete la chiave in cucina, dove tutti possano vederla. Il villaggio lo viene a sapere, come viene a sapere tutto, e lo approva: una famiglia che chiude il laboratorio del padre è una famiglia che vuole stare tranquilla.
    block setupEvent next=G1R1:
      ! Non succede niente.
  fragment lavora:
    > Spalancate le finestre, lavate gli alambicchi, riaccendete i fornelli. Nei cassetti trovate reagenti di ogni genere, ben conservati, etichettati con cura. Il padre comprava all'ingrosso: ce n'è per anni.
    block setupEvent next=G1R1:
      ! Ogni giocatore guadagna 1 {icon:Chemical_Icon}.
  fragment vendi:
    set sospetto = $sospetto + 1
    > Un rigattiere della città viene con un carro e se ne va con il microscopio d'ottone, la bilancia di precisione e due casse di vetreria. Paga bene, e in contanti. Il carro attraversa tutto il villaggio, e tutti vedono gli strumenti del vecchio ballare sotto il telo.
    block setupEvent next=G1R1:
      ! Ogni giocatore guadagna $2.

:: G1R1 [HUB]
  # **IL SALE IMPURO – Giovinezza**
  set round = 1
  if $hub != "G1R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 4**.
      include PreparaFolla
  set hub = "G1R1"
  include Traguardi
  if !$evCantiere:
    block hubTitle:
      ! {icon:Storybook} **Il manicomio di Lady Carew – Builder's Office**
    block hubDetails:
      ! L'impresa che costruisce il manicomio ha l'ufficio al Builder's Office. Il primo giocatore che ci manda un suo pezzo [[clicca qui. -> G1Cantiere]]
  if !$evTomba:
    block hubTitle:
      ! {icon:Storybook} **I fiori sulla tomba – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G1Tomba]]
  if !$evMuratori:
    block hubTitle:
      ! {icon:Storybook} **I muratori del manicomio – Laborer's Union**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Laborer's Union [[clicca qui. -> G1Muratori]]
  if !$evParco:
    block hubTitle:
      ! {icon:Storybook} **Il bambino con l'assegno – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G1Parco]]
  block hubTitle:
    ! {icon:Storybook} **La chiromante – Fortune Teller**
  block hubDetails:
    ! Quando un tuo pezzo visita il Fortune Teller, puoi pagare $1 e farti leggere la mano: [[clicca qui. -> G1Chiromante]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > Al mercato si parla solo del funerale, e dell'uomo con il cappotto nero che rideva in fondo al cimitero. Il fornaio giura che era il diavolo; il sagrestano, che era un creditore.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G1R1" next="G1Sale"

::round G1R1 1
fine: La Giovinezza della Prima Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

:: G1Cantiere
  set evCantiere = true
  # **Il manicomio di Lady Carew**
  > Nell'ufficio dell'impresa, tra rotoli di progetti e campioni di mattoni, c'è Lady Carew in persona: una signora alta e diritta, vestita di grigio, con un libretto rilegato in pelle sempre aperto sulle ginocchia. Ascolta il capomastro senza guardarlo, e annota.

  > Quando ti vede entrare chiude il libretto, sorride e ti chiede se sei lì per vedere "il futuro della carità in questa contea". Il manicomio avrà cento letti, dice, e ancora non sa come pagarne il tetto. Le famiglie per bene, di solito, contribuiscono. Le altre, di solito, finiscono dentro.
  ! Che cosa fai?
  [[Paghi $2 per il tetto del manicomio. ~> dona]]
  [[Chiedi di vedere i progetti. ~> progetti]]
  [[Dici che la tua famiglia non ha bisogno di manicomi. ~> rifiuta]]
  fragment dona:
    set carew = $carew + 1
    > Lady Carew ringrazia, scrive il tuo nome sul libretto con una calligrafia minuta e regolare e ti promette una targa d'ottone all'ingresso. Ti accompagna alla porta tenendoti sottobraccio, come si fa con i parenti, o con i pazienti.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP. Lady Carew si ricorderà della tua famiglia.
  fragment progetti:
    > Il capomastro srotola i disegni sul tavolo. Cento letti, è vero; acqua calda a ogni piano. Ma sotto il reparto dei signori c'è un piano che dalla facciata non si vede, con celle senza finestre e porte che si chiudono soltanto da fuori. Accanto, nella grafia minuta di Lady Carew, c'è scritto: *casi interessanti*.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge) e 1 {icon:Insanity_Icon}.
  fragment rifiuta:
    set carew = $carew - 1
    > Lo dici abbastanza forte perché lo senta anche il capomastro, e il garzone, e la donna che lava le scale. In paese la frase farà il giro delle osterie prima di sera, e molti la troveranno coraggiosa. Lady Carew no. Riapre il libretto e scrive qualcosa, senza smettere di sorridere.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Lady Carew si ricorderà della tua famiglia.

:: G1Tomba
  set evTomba = true
  # **I fiori sulla tomba**
  > Sulla tomba del padre ci sono fiori freschi. Non quelli del funerale, ormai secchi: fiori nuovi, ogni mattina, violette di campo legate con lo spago. Il custode dice di non aver mai visto chi li porta. Nella terra molle davanti alla lapide ci sono impronte di scarpe piccole e svelte, che girano tre volte intorno alla tomba e poi se ne vanno.
  ! Che cosa fai?
  [[Torni di notte, e aspetti. ~> guardia]]
  [[Porti via i fiori e li butti nel fiume. ~> fiori]]
  fragment guardia:
    set tomba = true
    > Aspetti dietro un cipresso fino alle tre, con il freddo nelle ossa. Poi il cancello cigola, e un piccolo uomo con il cappotto nero entra fischiettando, con un mazzetto di violette in mano. Si inginocchia davanti alla lapide e le parla, a lungo, a bassa voce, come si parla a uno specchio. Non capisci le parole. Capisci la risata, alla fine.

    > Quando esci dal nascondiglio il cimitero è vuoto, e le violette sono al loro posto.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 1 {icon:Insanity_Icon}. Hai visto Umber da vicino: non lo dimenticherai.
  fragment fiori:
    > Raccogli le violette e le butti nel fiume dal ponte, una manciata alla volta, come si fa con le cose che portano sfortuna. Tra gli steli c'è un biglietto ripiegato: *Per il vecchio, che dorme così bene.* La grafia pende all'indietro.

    > Il mattino dopo, sulla tomba, i fiori sono di nuovo lì.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Muratori
  set evMuratori = true
  # **I muratori del manicomio**
  > La sede del sindacato dei muratori è una stanza sopra la stalla dell'osteria, con una stufa, un tavolo e trenta uomini che non vengono pagati da sei settimane. Lady Carew, dicono, paga quando il lavoro è finito, e il lavoro non finisce mai, perché Lady Carew cambia idea ogni lunedì. Ieri notte qualcuno ha lasciato sul tavolo una busta: dentro, sei settimane di paga per tutti, in assegni. Gli uomini non sanno se possono incassarli.
  ! Che cosa fai?
  [[Dici che gli assegni sono buoni: incassateli. ~> buoni]]
  [[Dici che sono falsi, e paghi tu $2 per il pane. ~> pane]]
  [[Porti la busta a Lady Carew. ~> carew]]
  fragment buoni:
    set sospetto = $sospetto + 1
    > Gli assegni sono buoni, naturalmente. Gli uomini li incassano tutti lo stesso giorno, e la banca del villaggio resta senza contanti fino a sera. Per un mese, all'osteria, si brinda alla salute di Mr. Umber, il benefattore dei muratori.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Bodies_Icon}: un muratore riconoscente ti deve un favore.
  fragment pane:
    > Gli uomini bruciano la busta nella stufa, e tu paghi il pane e la zuppa per una settimana. Lady Carew, quando lo viene a sapere, ti manda un biglietto gelido: la carità, scrive, si fa attraverso i canali appropriati.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP.
  fragment carew:
    set carew = $carew + 1
    > Lady Carew apre la busta davanti a te, guarda gli assegni uno per uno e li chiude nel suo libretto rilegato in pelle, senza un'espressione. "Grazie", dice. "Avete fatto la cosa giusta. Pagherò gli operai la settimana prossima." Li paga, infatti. Con gli assegni di Umber.
    block setupEvent next=$hub:
      ! Guadagni 1VP. Lady Carew si ricorderà della tua famiglia.

:: G1Parco
  set evParco = true
  # **Il bambino con l'assegno**
  > Nel Park, vicino allo stagno, un bambino gioca da solo con una barchetta di carta. La barchetta è un assegno, piegato con cura: si vedono ancora la cifra, la firma e la grafia che pende all'indietro. Gliel'ha regalato, dice, un signore piccolo piccolo con il cappotto nero, "perché ero triste".
  ! Che cosa fai?
  [[Gli compri la barchetta per $1. ~> compra]]
  [[Gli chiedi che cosa gli ha detto il signore. ~> chiedi]]
  [[Lo riaccompagni da sua madre. ~> madre]]
  fragment compra:
    set sospetto = $sospetto - 1
    > Il bambino accetta la moneta con la serietà di un banchiere, e ti consegna la barchetta bagnata. A casa la spieghi sul tavolo: l'assegno è firmato con il nome di uno di voi. Lo bruci prima che asciughi.
    block setupEvent next=$hub:
      ! Paga $1.
  fragment chiedi:
    > Il bambino ci pensa a lungo, con la fronte aggrottata. "Ha detto che era il nonno", risponde alla fine. "Il nonno di tutti. Che aveva tanti nipoti, e che io non ero uno di loro, ma che gli piacevo lo stesso." Poi riprende a giocare, e non dice altro.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 1 {icon:Creepy_Icon}.
  fragment madre:
    > La madre è una lavandaia, con le mani rosse e la voce stanca. Quando le racconti dell'assegno impallidisce, poi ti ringrazia, poi ti chiede se la tua famiglia ha bisogno di qualcuno per il bucato. Ne ha bisogno, scopri: la casa è grande, e nessuno vuole lavorare alla tenuta.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G1Duello
  set evDuello = true
  # **Una sfida all'alba**
  > All'alba, nel Park, vicino allo stagno, ti aspetta un giovane ufficiale in congedo, pallido di rabbia, con due padrini e una cassetta di pistole. Ieri sera, all'osteria, un ometto in nero, con il bavero alzato, gli ha rovesciato il vino addosso, ha insultato sua sorella e gli ha dato un biglietto da visita. Sul biglietto c'era il nome della tua famiglia. L'ufficiale vuole soddisfazione.
  ! Che cosa fai?
  [[Accetti la sfida. ~> accetta]]
  [[Chiedi scusa, e paghi $2 per il vino. ~> scusa]]
  [[Gli mostri il biglietto: la grafia non è tua. ~> grafia]]
  fragment accetta:
    > Venti passi, nella nebbia. L'ufficiale spara per primo e sbaglia, di molto: gli tremano le mani. Tu spari in aria. I padrini si stringono la mano, l'ufficiale ti abbraccia e piange un po', e il villaggio racconta la storia per un anno, sempre più bella.
    block setupEvent next=$hub:
      ! Guadagni 2VP e 1 {icon:Insanity_Icon}.
  fragment scusa:
    > Chiedi scusa per una cosa che non hai fatto, con tutta la dignità che riesci a trovare, e paghi il vino. L'ufficiale accetta, rigido. I padrini sembrano delusi. Mentre torni a casa ti accorgi che le mani, adesso, tremano a te.
    block setupEvent next=$hub:
      ! Paga $2. Arretra di 1 casella sul tracciato {icon:Creepy_Icon}.
  fragment grafia:
    set haskett = $haskett + 1
    > L'ufficiale guarda il biglietto, poi la tua firma, poi di nuovo il biglietto. La grafia del biglietto pende all'indietro; la tua no. Per un momento sembra deluso di non doverti sparare. Poi ti porge la mano, e la sera stessa porta il biglietto all'Ispettore Haskett, con i tuoi saluti.
    block setupEvent next=$hub:
      ! Guadagni 1VP. L'Ispettore Haskett si ricorderà della tua famiglia.

:: G1Parroco
  set evParroco = true
  # **Il parroco**
  > Il parroco è un uomo grasso e gentile, con le dita macchiate di tabacco e una memoria eccellente per i funerali. Si ricorda bene quello di vostro padre: il cielo basso, la poca gente, l'uomo che rideva in fondo. Si ricorda soprattutto i portatori, che a metà della navata hanno dovuto fermarsi a riprendere fiato. "Pesava come un sasso", dice. "Glielo dissi, al notaio. Lui mi rispose che il dolore pesa."
  ! Che cosa fai?
  [[Offri $2 per una messa in suffragio. ~> messa]]
  [[Gli chiedi chi ha chiuso la bara. ~> bara]]
  [[Ringrazi e te ne vai. ~> vai]]
  fragment messa:
    > Il parroco accetta, e la domenica dopo celebra una messa lunga e ben cantata. In fondo alla chiesa, durante l'elevazione, qualcuno ride piano. Quando ti volti, c'è solo una vecchia che dorme.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 2VP.
  fragment bara:
    set parroco = true
    > Il parroco sfoglia il registro dei morti. "Il falegname la inchiodò la sera prima, alla presenza del notaio Pell e del medico condotto. Nessun altro. Il notaio insistette perché nessuno la riaprisse: volontà del defunto." Chiude il registro. "Allora mi parve un gesto d'affetto. Adesso, non so."
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon}. Te ne ricorderai.
  fragment vai:
    > Ringrazi e te ne vai. Sul sagrato ti accorgi che il parroco ti segue con lo sguardo dalla porta, e si fa il segno della croce. Forse è per te. Forse è per tuo padre.
    block setupEvent next=$hub:
      ! Non succede niente.

:: G1Nozze
  set evNozze = true
  include CasoGiocatore
  # **Le nozze**
  > In chiesa si sposa la figlia del sindaco, e tutta la buona società del villaggio è sui banchi, compresa la famiglia della tenuta. A metà della cerimonia, quando il parroco chiede se qualcuno conosce un motivo per cui i due non debbano sposarsi, in fondo alla chiesa qualcuno ride. Tutti si voltano. Non c'è nessuno, ma sull'ultimo banco c'è un regalo di nozze incartato in carta nera, con un biglietto: *Da parte di Mr. Umber, con i migliori auguri.*
  ! Che cosa fai?
  [[Prendi il pacchetto e lo porti fuori, prima che lo apra qualcuno. ~> porta]]
  [[Lasci che gli sposi lo aprano. ~> apri]]
  fragment porta:
    > Lo porti fuori sotto la giacca, mentre il parroco riprende la cerimonia. Nel cimitero, al riparo di una tomba, lo apri. Dentro c'è un servizio di posate d'argento, bellissimo, con le iniziali della tua famiglia. Mancano soltanto i coltelli.
    block setupEvent next=$hub:
      ! Guadagni $2: rivendi le posate in città, senza fare domande.
  fragment apri:
    set sospetto = $sospetto + 1
    > Gli sposi lo aprono al rinfresco, davanti a tutti. Dentro c'è un servizio di posate d'argento, bellissimo, con le iniziali della tua famiglia. La sposa ringrazia la famiglia della tenuta per il magnifico regalo. Il sindaco, invece, guarda le iniziali, e poi guarda **{$caso}**, a lungo.
    block setupEvent next=$hub:
      ! **{$caso}** avanza di 1 casella sul tracciato {icon:Creepy_Icon}. Tu guadagni 1VP.

:: G1Ronda
  set evRonda = true
  # **La ronda**
  > Il sindaco ha deciso che è ora di finirla con gli avvistamenti. Vuole una ronda notturna: sei uomini con le lanterne e i bastoni, a girare per le strade dal tramonto all'alba. Mancano gli uomini, e manca il denaro. Quando ti vede entrare in municipio ti accoglie con un sorriso largo, come si accoglie un finanziatore.
  ! Che cosa fai?
  [[Paghi $2 per la ronda. ~> paga]]
  [[Ti offri volontario, per una notte. ~> volontario]]
  [[Dici che la ronda è una sciocchezza. ~> rifiuta]]
  fragment paga:
    set sospetto = $sospetto - 1
    > La ronda gira per un mese intero, con le lanterne e i bastoni. Non prende nessuno. Ma il villaggio dorme meglio, e sa chi ha pagato le lanterne.
    block setupEvent next=$hub:
      ! Paga $2 e guadagni 1VP.
  fragment volontario:
    > Giri per le strade con altri cinque, una lanterna e un bastone che non sai usare. Alle tre, in fondo al vicolo dietro la tenuta, vedi un'ombra piccola che si ferma, si volta e ti saluta con il cappello. Gli altri non l'hanno vista. Tu non lo dici.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 1 {icon:Insanity_Icon}. Guarda in segreto un Avvistamento {icon:S2_HuntTokenFRONT} a faccia in giù sul tabellone, senza girarlo.
  fragment rifiuta:
    set sospetto = $sospetto + 1
    > Il sindaco smette di sorridere. Una famiglia che non vuole la ronda, dice più tardi all'osteria, è una famiglia che di notte ha qualcosa da fare. L'osteria è d'accordo.
    block setupEvent next=$hub:
      ! Guadagni $1: il denaro che non hai dato.

// La chiromante: si può tornare quante volte si vuole, con un esito a caso.
:: G1Chiromante
  # **La chiromante**
  ! Paga $1.
  if $round >= 4:
    > La chiromante di adesso è la figlia di quella di una volta: lo stesso fazzoletto rosso, gli stessi occhi chiari, quasi bianchi, e una tenda più grande, con una stufa di ghisa e un ritratto della madre appeso al palo. Prende la tua mano sinistra, poi la destra, e sorride. "Mia madre mi ha parlato della vostra famiglia", dice. "Mi ha detto di farmi pagare prima."
  else:
    > La chiromante è una vecchia con un fazzoletto rosso in testa e gli occhi chiari, quasi bianchi. Prende la tua mano sinistra, poi la destra, poi di nuovo la sinistra, e aggrotta la fronte.
  set variante = either(1, 2, 3, 4)
  if $variante == 1:
    > "Due linee della vita", dice. "Una corta e una lunga. Non so quale sia la tua." Ti chiude le dita sul palmo, come per tenerci dentro qualcosa, e non vuole dire altro.
    ! Guadagni 1 {icon:Insanity_Icon} e una risorsa a scelta ({icon:Bodies_Icon}, {icon:Chemical_Icon}, {icon:Gears_Icon} o {icon:Animal_Icon}).
  elif $variante == 2:
    > "Vedo denaro", dice. "Molto denaro, e non tuo. Firmato da un altro." Ride, con tutti i denti che le mancano. "Prendilo finché c'è." Sulla strada del ritorno trovi nel fango un portafoglio senza nome.
    ! Guadagni $2.
  elif $variante == 3:
    > "Vedo una porta", dice. "Tu stai da questa parte. Resta da questa parte." Per una volta, la cosa ti sembra un ottimo consiglio, e quella notte dormi come non dormivi da mesi.
    ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
  else:
    > La vecchia ti lascia andare la mano di colpo, come se scottasse, e ti rimette in tasca la moneta. "Questa mano non è tua", dice. "L'hai presa in prestito. Restituiscila." Poi chiude la tenda, e non la riapre più.
    ! Riprendi il tuo $1. Guadagni 1 {icon:Creepy_Icon}.
  [[Torna al Round. => $hub]]

:: G1Sale
  # **Le boccette**
  include CasoGiocatore
  ! **Diario di {$caso} – *1862.***
  > Oggi, nel laboratorio, il pavimento ha ceduto sotto il mio piede: una tavola smossa accanto alla stufa, che qualcuno aveva rimesso a posto con troppa cura. Sotto c'era una cassetta di zinco, e nella cassetta sei boccette di vetro scuro, chiuse con la ceralacca. Sale bianco, fine come zucchero, con un riflesso giallognolo quando lo si guarda controluce. Sull'etichetta: *Farmacia Lomax – prima partita*. Legato alla cassetta con lo spago, un biglietto nella mano di nostro padre: *Una sola sorsata. Poi la porta.*

  > Non abbiamo ancora deciso che cosa farne. Nel frattempo, al villaggio, il fornaio si è presentato a riscuotere un assegno firmato da nostro padre, con la data della settimana scorsa: più di un anno dopo il funerale. Gliel'ha dato un piccolo uomo con un cappotto nero troppo largo, che ha comprato tutto il pane della bottega e l'ha buttato nel fiume, una pagnotta alla volta, ridendo.

  > Abbiamo pagato il fornaio, e ci siamo fatti dare l'assegno. La firma è di nostro padre, non c'è dubbio. Ma pende all'indietro, come se l'avesse scritta con la mano sbagliata.
  ! Che cosa fate dell'assegno? *(Decide {$caso}, sentiti gli altri.)*
  [[Lo bruciate, e non ne parlate con nessuno. ~> brucia]]
  [[Lo portate alla polizia. ~> polizia]]
  fragment brucia:
    > L'assegno brucia in fretta, con una fiamma verdognola che nessuno commenta. Il fornaio, pagato due volte, ha promesso di tacere; e mantiene la promessa per quasi una settimana.
    include G1SaleSetup
  fragment polizia:
    set haskett = $haskett + 1
    set sospetto = $sospetto + 1
    > La polizia del villaggio è una donna sola: l'Ispettore Nell Haskett, alta, magra, con un taccuino nero e una matita sempre appuntita. Legge l'assegno controluce, lo annusa e lo chiude nel taccuino. "Grazie", dice. "Siete i primi, in questo villaggio, a portarmi qualcosa invece di nasconderlo. Me lo ricorderò." Il villaggio, che ha visto la carrozza della tenuta davanti alla polizia, se lo ricorderà anche lui.
    include G1SaleSetup

:: G1SaleSetup
  block setupEvent next=G1Cronaca1:
    set _SetupImage = "S2_HuntTokenFRONT"
    ! Dalla Scatola di **Fear of the Unknown** prendete gli **Hunt token** {icon:S2_HuntTokenFRONT}: in questo scenario sono gli **Avvistamenti** di Mr. Umber. Teneteli accanto al tabellone.
    ! Prendete anche le **Obsession card** e tenetele coperte accanto al tabellone.
    ! Prendete i **Money token** {icon:S2_ColoredMoneyToken}: ognuno prende quello del proprio colore. Sono gli **assegni** che Umber firma con il vostro nome.
    ! Prendete le **20 Estate Upgrade** della scatola e mescolatele nel mazzo delle Migliorie della Generazione I/II.

// Cronaca: il villaggio racconta quello che la famiglia ha fatto nella Giovinezza.
:: G1Cronaca1
  # **Cronaca del villaggio**
  ! **Gazzetta di {$townname} – *1863.***
  > **NOTIZIE DALLA COLLINA.** Proseguono i lavori del nuovo manicomio di Lady Carew. Il capomastro assicura che il tetto sarà pronto prima dell'inverno, e che le celle del reparto dei poveri avranno, per la prima volta nella contea, una finestra ciascuna. Piccola, ma una finestra.
  if $carew > 0:
    > Tra i benefattori che hanno contribuito al tetto, Lady Carew ha voluto ringraziare pubblicamente la famiglia della tenuta, "che ha capito prima di altre il valore della prevenzione". Il nome della famiglia sarà inciso su una targa d'ottone all'ingresso.
  elif $carew < 0:
    > Lady Carew ha voluto ricordare, nel suo discorso al comitato, che "certe famiglie della contea preferiscono tenere i propri malati in casa, finché non è troppo tardi". Non ha fatto nomi. Al comitato, tutti hanno guardato verso la collina della tenuta.
  if $tomba:
    > Il custode del cimitero segnala che da qualche tempo, sulla tomba del vecchio della tenuta, compaiono ogni mattina violette fresche, e che un erede della famiglia è stato visto aggirarsi tra le lapidi a notte fonda. Questo giornale non trae conclusioni.
  if $evMuratori:
    > Si è chiusa intanto, senza incidenti, la vertenza dei muratori del cantiere, rimasti senza paga per sei settimane, in circostanze che il sindacato preferisce non commentare.
  if $evParco:
    > Una lavandaia del villaggio racconta che suo figlio ha ricevuto in regalo, nel Park, un assegno piegato a forma di barchetta, firmato con il nome di un erede della tenuta. La famiglia, interpellata, non ha commentato.
  if $sospetto >= 3:
    > All'osteria, la sera, si parla poco d'altro che di Mr. Umber e della tenuta. Il parroco, dal pulpito, ha raccomandato ai fedeli di non prestare orecchio alle chiacchiere. Il che, naturalmente, le ha raddoppiate.
  else:
    > Per il resto, il villaggio è tranquillo. Il raccolto è stato buono, il fiume non è uscito dagli argini, e l'uomo con il cappotto nero, quest'anno, si è fatto vedere poco.
  [[Continua... => G1R2]]

// Il sale, gli assegni e gli avvistamenti: le voci dell'hub dalla Maturità della Prima.
:: VociSale
  block hubTitle:
    ! {icon:Chemical_Icon} **Il sale**
  block hubDetails:
    ! Quando il tuo Scienziato fa un'azione nella Tenuta, puoi bere il sale: [[clicca qui. -> BeviChi]]
  block hubTitle:
    ! {icon:S2_ColoredMoneyToken} **Gli assegni**
  block hubDetails:
    ! All'inizio di ogni Round, chi ha bevuto il sale nel Round precedente mette il proprio Money token su un Luogo. Chi visita un Luogo con l'assegno di un altro giocatore [[clicca qui. -> Assegno]]
  block hubTitle:
    ! {icon:S2_HuntTokenFRONT} **Avvistamenti**
  block hubDetails:
    ! Chi visita un Luogo con un Avvistamento lo gira e [[clicca qui. -> AvvistamentoChi]]

:: BeviChi
  set dopo = "Bevi"
  goto ChiSei

:: Assegno
  # **Un assegno con il tuo nome**
  if $round >= 4:
    > Il negoziante ti fa entrare nel retrobottega, lontano dai clienti. Ha un assegno: la firma è il nome di uno dei tuoi parenti, la grafia pende all'indietro, e il timbro della banca è autentico. L'ha portato ieri sera, nella nebbia, un ometto in nero, che ha comprato tutte le candele del negozio e le ha accese, una per una, sul marciapiede.
  else:
    > Il bottegaio ti aspetta sulla porta, con l'aria di chi si è preparato il discorso. Ha in mano un assegno: la cifra è piccola, la firma è il nome di uno dei tuoi parenti, e la scrittura pende all'indietro. L'ha incassato ieri sera un piccolo uomo con il cappotto nero, che ha pagato una bottiglia di vino e l'ha rotta sul marciapiede per sentire il rumore.

  > Non vuole storie: vuole i suoi soldi. Oppure, se preferisci, può raccontare tutto alla polizia.
  ! Che cosa fai?
  [[Paghi $1 al giocatore che ha firmato l'assegno, e taci. ~> paga]]
  [[Lo denunci alla polizia. ~> denuncia]]
  fragment paga:
    block setupEvent next=$hub:
      ! Paga $1 al proprietario dell'assegno, che lo riprende.
  fragment denuncia:
    set sospetto = $sospetto + 1
    block setupEvent next=$hub:
      ! Guadagni 1VP. Il proprietario dell'assegno lo riprende e avanza di 1 sul tracciato {icon:Creepy_Icon}.

:: AvvistamentoChi
  set dopo = "Avvistamento"
  goto ChiSei

:: Avvistamento
  # **L'avvistamento**
  if !$porta && $chiave != "" && $chi == $chiave:
    set porta = true
  if !$porta && $round >= 2:
    set porta = either(true, false, false)
  if $porta && $casa == "":
::for L in A B C D
    if $chi == "%L%":
      set casa = $name%L%
::endfor
    > Le impronte nel fango sono piccole e svelte, e vanno in una sola direzione. Le segui oltre il mercato, oltre il ponte, fino al vicolo dietro la tenuta, dove finiscono davanti a una porta di legno senza maniglia né serratura.
    if $chi == $chiave:
      > Hai in tasca la chiave dell'apprendista, quella con la testa a forma di occhio. Non c'è un buco dove infilarla; ma quando la avvicini al legno, qualcosa dall'altra parte scatta, e la porta si apre.
    else:
      > Quando la tocchi, si apre: qualcuno, dall'altra parte, ha dimenticato di chiuderla.

    > Dietro c'è lo studio sul vicolo, quello del testamento: una stanza che nessuno di voi era mai riuscito a trovare, con le pareti coperte di specchi e un'altra porta, quella sì con la maniglia, che dà sul corridoio della tenuta. Una casa con due porte. Da una entra uno scienziato rispettabile; dall'altra esce chi vuole.
    block setupEvent next=$hub:
      set _SetupImage = "S2_HouseOnTheHillTile"
      ! Prendi la **House on the Hill** dalla Scatola di **Fear of the Unknown** e mettila accanto alla tua Tenuta: è **la casa con due porte**. Rimetti l'Avvistamento nella scatola.
  else:
    set falso = either(1, 2, 3, 4)
    if $round >= 4:
      set falso = $falso + 4
    if $falso == 1:
      > Il piccolo uomo con il cappotto nero, all'angolo della strada, è un ragazzino con il cappotto di suo nonno e un cappello di carta. Gioca a fare Umber per spaventare le sorelle, e ci riesce benissimo. Quando ti vede, scappa ridendo.
    elif $falso == 2:
      > Lo trovi dove ti avevano detto: un cappotto nero appeso a una staccionata ad asciugare, con il bavero alzato e un manico di scopa per spalle. Da lontano, nella nebbia, sembrava davvero un uomo che aspettava qualcuno.
    elif $falso == 3:
      > È un ubriaco, addormentato su un gradino con addosso un cappotto nero che non è suo. Quando lo svegli giura di averlo avuto da un piccolo signore molto gentile, che rideva tanto, in cambio di una canzone.
    elif $falso == 4:
      > Non c'è nessuno: solo un gatto nero che rovista tra i rifiuti. Sul selciato, però, c'è un tappo di ceralacca, con l'impronta di un sigillo che ti sembra di aver già visto.
    elif $falso == 5:
      > Nella nebbia, sotto un lampione, un piccolo uomo con il cappotto nero aspetta, immobile. Ti avvicini piano. È un manichino, rubato dalla vetrina di un sarto e messo lì per scherzo da qualche studente. Al collo ha un cartello: *Avete perso tempo.*
    elif $falso == 6:
      > È un vagabondo basso di statura, che le guardie di Ada Haskett hanno già fermato due volte. Ormai ci ha preso gusto: gira di notte con un cappotto nero comprato apposta, e si fa arrestare per avere un letto caldo in cella.
    elif $falso == 7:
      > L'ombra che hai visto scivolare lungo il muro è quella di un lampionaio, piccolo e svelto, con la scala in spalla e la pertica in mano. Ti saluta con educazione. Non ha mai visto Umber, dice: e la cosa, a quanto pare, gli dispiace molto.
    else:
      > Non c'è nessuno, ma sul muro, all'altezza degli occhi, qualcuno ha disegnato con il gesso un piccolo uomo con il cappello. Sotto c'è una freccia che indica il vicolo da cui arrivi.
    block setupEvent next=$hub:
      ! È un falso allarme. Guadagni 1VP. Rimetti l'Avvistamento nella scatola.

:: G1R2 [HUB]
  # **IL SALE IMPURO – Maturità**
  set round = 2
  if $hub != "G1R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Andate a **pagina 5** della Village Chronicle, sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}).
  set hub = "G1R2"
  include Traguardi
  include VociSale
  if !$evHaskett:
    block hubTitle:
      ! {icon:Storybook} **L'interrogatorio – Town Hall**
    block hubDetails:
      ! L'Ispettore Haskett riceve al pianterreno del municipio. Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G1Interrogatorio]]
  if !$evLomax:
    block hubTitle:
      ! {icon:Storybook} **Il banco del farmacista – Farmer's Bazaar**
    block hubDetails:
      ! Il giovedì il farmacista Lomax tiene un banco al mercato. Il primo giocatore che manda un suo pezzo al Farmer's Bazaar [[clicca qui. -> G1Lomax]]
  if !$evDuello:
    block hubTitle:
      ! {icon:Storybook} **Una sfida all'alba – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G1Duello]]
  if !$evParroco:
    block hubTitle:
      ! {icon:Storybook} **Il parroco – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G1Parroco]]
  if !$evApprendista:
    block hubTitle:
      ! {icon:Storybook} **La chiave senza porta – Blacksmith's Apprentice**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Blacksmith's Apprentice [[clicca qui. -> G1ApprendistaChi]]
  block hubTitle:
    ! {icon:Storybook} **La chiromante – Fortune Teller**
  block hubDetails:
    ! Quando un tuo pezzo visita il Fortune Teller, puoi pagare $1 e farti leggere la mano: [[clicca qui. -> G1Chiromante]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > L'Ispettore Nell Haskett, la prima donna con quel grado in tutta la contea, ha aperto un fascicolo sugli assegni di Umber. Gira per le botteghe con un taccuino nero e una matita sempre appuntita, e scrive tutto: anche quello che non le dite.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G1R2" next="G1Manicomio"

::round G1R2 2
fine: La Maturità della Prima Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Vecchiaia prima di continuare.

:: G1Interrogatorio
  set evHaskett = true
  # **L'interrogatorio**
  > L'ufficio dell'Ispettore Haskett è una stanza stretta al pianterreno del municipio, con una stufa che non scalda e un ritratto del sovrano storto sulla parete. Ti fa sedere, ti offre un tè che non bevi e posa sul tavolo, uno accanto all'altro, sei assegni con i nomi della tua famiglia.

  > "Non vi accuso di niente", dice. "Vorrei solo sapere chi, a casa vostra, esce di notte."
  ! Che cosa le dici?
  [[La verità: in famiglia c'è un sale, e qualcuno lo beve. ~> verita]]
  [[Che a casa vostra, di notte, si dorme. ~> menti]]
  [[Un nome: quello di un tuo parente. ~> accusa]]
  fragment verita:
    set haskett = $haskett + 1
    set sospetto = $sospetto + 1
    > Racconti delle boccette, del biglietto del padre, della prima sorsata. L'Ispettore ascolta senza interromperti e senza prendere appunti, e quando hai finito resta zitta a lungo. Poi chiude il taccuino. "Non posso arrestare un sale", dice. "Ma da oggi so dove guardare. E so che di uno di voi, almeno, posso fidarmi."
    block setupEvent next=$hub:
      ! Guadagni 1VP. L'Ispettore Haskett si ricorderà della tua famiglia.
  fragment menti:
    set haskett = $haskett - 1
    > Dici che alla tenuta si va a letto presto, che il laboratorio è chiuso a chiave e che gli assegni sono certamente falsi. L'Ispettore annuisce a ogni frase, con gentilezza, e a ogni frase scrive una parola sul taccuino. Alla fine ti accompagna alla porta e ti augura la buona notte, con una certa insistenza.
    block setupEvent next=$hub:
      ! Non succede niente. L'Ispettore Haskett, però, si ricorderà della tua famiglia.
  fragment accusa:
    set sospetto = $sospetto + 1
    > Fai un nome. Non è il tuo. L'Ispettore lo scrive in stampatello, lo sottolinea due volte e ti ringrazia per la collaborazione; poi ti guarda come si guarda un cane che ha portato in casa un topo morto. Tornando alla tenuta incroci il parente che hai nominato. Ti saluta. Non sa ancora niente.
    block setupEvent next=$hub:
      ! Indica un altro giocatore: avanza di 1 sul tracciato {icon:Creepy_Icon}. Tu guadagni 1VP.

:: G1Lomax
  set evLomax = true
  # **Il banco del farmacista**
  > Il farmacista Lomax ha il suo banco tra le gabbie dei polli e le forme di formaggio: sciroppi per la tosse, pillole per il fegato, sali per tutte le occasioni. È un uomo magro, ancora giovane, con le dita macchiate di giallo e l'aria di chi aspetta una cattiva notizia da molti anni.

  > Quando gli chiedi della prima partita di sale venduta a vostro padre diventa pallido e dice di non ricordare: ha venduto tanto sale, a tanta gente. Ma tiene la mano posata sul registro, come se potesse scappare.
  ! Che cosa fai?
  [[Gli offri $3 per una pagina del registro. ~> compra]]
  [[Lo prendi per il bavero. ~> minaccia]]
  [[Compri una boccetta del suo sale. ~> sale]]
  fragment compra:
    set lomax = "registro"
    > Lomax guarda il denaro, poi la folla, poi di nuovo il denaro. Strappa una pagina dal registro e te la dà piegata in quattro. *9 novembre 1859: sei boccette, sale bianco, consegnate al signore della tenuta.* Nella colonna degli ingredienti, accanto al sale, c'è una riga cancellata con tanta cura che l'inchiostro ha bucato la carta.
    block setupEvent next=$hub:
      ! Paga $3. Guadagni 1 Conoscenza Chimica (Chemistry Knowledge). La pagina resta alla tua famiglia: lo Storybook se ne ricorderà.
  fragment minaccia:
    set lomax = "minacciato"
    set sospetto = $sospetto + 1
    > Lo prendi per il bavero davanti a tutto il mercato. Le galline starnazzano, una forma di formaggio rotola nel fango, e qualcuno corre a chiamare l'Ispettore. Lomax non parla. Ti spinge in mano una boccetta di sale, "la migliore che ho", e ti prega di andartene. Quella sera, nel bicchiere, il sale si tinge appena di rosso, e niente più.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Chemical_Icon} e 1 {icon:Creepy_Icon}.
  fragment sale:
    > Lomax te la incarta con cura e non ti fa nemmeno pagare. "Sale della seconda partita", dice. "Purissimo. Vostro padre ne comprò chili, dopo. Non gli piacque mai." Lo provi quella sera stessa, in un bicchiere d'acqua: diventa rosso e si ferma lì. Non succede niente. Questa, chissà perché, ti sembra la notizia peggiore.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Chemical_Icon}.

:: G1ApprendistaChi
  set dopo = "G1Apprendista"
  goto ChiSei

:: G1Apprendista
  set evApprendista = true
  # **La chiave senza porta**
  > L'apprendista del fabbro è un ragazzo con le braccia nere fino ai gomiti e la lingua lunga. Mentre lavora ti racconta che il mese scorso un piccolo signore con il cappotto nero gli ha ordinato una chiave strana: senza denti, con la testa a forma di occhio, "per una porta che si apre solo da dentro". L'ha pagata con un assegno. Il ragazzo ha tenuto lo stampo, perché non si sa mai.
  ! Che cosa fai?
  [[Paghi $2 per una copia della chiave. ~> copia]]
  [[Lo denunci all'Ispettore Haskett. ~> denuncia]]
  [[Lasci perdere. ~> niente]]
  fragment copia:
::for L in A B C D
    if $chi == "%L%":
      set chiave = "%L%"
::endfor
    > Il ragazzo ci mette tutto il pomeriggio. La chiave che ti consegna è ancora tiepida, pesante, inutile: non c'è serratura al mondo in cui possa entrare. Eppure, quando la stringi in mano, ti sembra che tiri leggermente verso il vicolo dietro la tenuta, come l'ago di una bussola.
    block setupEvent next=$hub:
      ! Paga $2. Hai la chiave dell'apprendista: la prossima volta che giri un Avvistamento, potrebbe servirti.
  fragment denuncia:
    set haskett = $haskett + 1
    > L'Ispettore sequestra lo stampo e ringrazia. Il ragazzo passa una notte in cella e ne esce con un occhio nero e una pessima opinione della tua famiglia. Lo stampo, nel deposito della polizia, sparisce dopo tre giorni.
    block setupEvent next=$hub:
      ! Guadagni 1VP. L'Ispettore Haskett si ricorderà della tua famiglia.
  fragment niente:
    > Lasci il ragazzo alle sue chiacchiere e alla sua incudine. Tornando a casa passi per il vicolo dietro la tenuta, senza volerlo, e senza volerlo cerchi con gli occhi una porta senza maniglia. Non la vedi. Il che non vuol dire che non ci sia.
    block setupEvent next=$hub:
      ! Non succede niente.

:: G1Manicomio
  # **Il manicomio di Lady Carew**
  ! **Gazzetta di {$townname} – *1868.***
  > **IL NUOVO MANICOMIO APRE LE PORTE.** Ieri mattina, alla presenza del vescovo e delle migliori famiglie della contea, Lady Carew ha inaugurato il manicomio sulla collina: cento letti, acqua calda a ogni piano, giardini per il passeggio e un reparto per i signori, separato da quello dei poveri da un muro alto quattro metri.

  > Nel suo discorso Lady Carew ha invitato le famiglie per bene a non vergognarsi: la follia, ha detto, non è una colpa ma una malattia, e si cura meglio quando la si prende in tempo. Chi ha in casa un parente che dorme troppo poco, esce di notte o vede cose che gli altri non vedono, ha il dovere di segnalarlo.

  > Questo giornale ha appreso che la prima segnalazione è già arrivata, in forma anonima, e riguarda uno degli eredi della tenuta. La lettera è scritta in una grafia minuta, inclinata all'indietro.
  if $carew > 0:
    > Lady Carew, che ha il nome della famiglia su una targa d'ottone all'ingresso, ha voluto precisare che chiunque venga segnalato riceverà le cure migliori, nel reparto dei signori.
  elif $carew < 0:
    set sospetto = $sospetto + 1
    > Lady Carew ha aggiunto che certe famiglie, "che non hanno bisogno di manicomi", farebbero bene a ricordare che il manicomio, invece, ha bisogno di loro.
  [[Clicca per continuare... => G1ManicomioVoto]]

:: G1ManicomioVoto
  # **Internarlo?**
  ui specialEvent
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: l'erede che ha bevuto più volte viene internato *(lo sa solo chi ha bevuto: può mentire)*.
  ! NAY: la famiglia lo protegge.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G1ManicomioEsito" mode="Voting"

:: G1ManicomioEsito
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Un erede viene internato. (YAY) ~> si]]
  [[La famiglia lo protegge. (NAY) ~> no]]
  fragment si:
    set internato = true
    set sospetto = $sospetto - 2
    > La carrozza del manicomio arriva al mattino presto, con due infermieri in grembiule bianco e un modulo già compilato. La famiglia firma senza guardarsi negli occhi. Lady Carew, che ha voluto accompagnare di persona il suo primo paziente di riguardo, ringrazia tutti per il senso civico; e il villaggio, per qualche mese, smette di parlare della tenuta.
    if $carew > 0:
      block setupEvent next=G1Cronaca2:
        ! Il giocatore che ha bevuto più volte *(a sua scelta, se nessuno lo ammette: il Primo Giocatore)* mette il proprio Scienziato sul Lost per tutto il prossimo Round, e guadagna 1 {icon:Insanity_Icon}: il reparto dei signori è comodo.
    else:
      block setupEvent next=G1Cronaca2:
        ! Il giocatore che ha bevuto più volte *(a sua scelta, se nessuno lo ammette: il Primo Giocatore)* mette il proprio Scienziato sul Lost per tutto il prossimo Round, e guadagna 2 {icon:Insanity_Icon}.
  fragment no:
    set sospetto = $sospetto + 2
    > La famiglia chiude il cancello e non risponde alle lettere. Lady Carew passa due volte in carrozza davanti alla tenuta senza fermarsi; la terza si ferma, guarda a lungo le finestre del laboratorio e scrive qualcosa sul suo libretto rilegato in pelle. Al villaggio si dice che i signori della tenuta abbiano qualcosa da nascondere. Al villaggio, per una volta, hanno ragione.
    block setupEvent next=G1Cronaca2:
      ! Non succede niente. Per ora.

:: G1Cronaca2
  # **Una lettera**
  ! **Lettera dell'Ispettore Nell Haskett a sua sorella – *1874.***
  > Cara Margaret, ti scrivo dal mio ufficio, con la stufa spenta perché il comune non paga la legna. Il caso Umber mi toglie il sonno. Sono tredici anni che raccolgo assegni con la stessa grafia, e tredici anni che quella famiglia mi sorride sulla porta di casa.
  if $haskett > 1:
    > Devo dire che non tutti mi mentono. Qualcuno, lassù alla tenuta, mi ha detto la verità più di una volta, anche quando gli costava. Non so se sia coraggio o stanchezza. In ogni caso, me ne ricordo.
  elif $haskett < 0:
    > Mi mentono tutti, lassù, con una cortesia che mi fa venire voglia di arrestarli per principio. Ho imparato a riconoscere le loro bugie dal modo in cui si aggiustano i polsini.
  if $lomax == "registro":
    > Ho saputo che uno di loro ha comprato una pagina del registro del farmacista Lomax, al mercato, davanti a mezzo villaggio. Non so che cosa ci fosse scritto. Lomax, da allora, chiude la farmacia alle sei.
  elif $lomax == "minacciato":
    > Uno di loro ha preso per il bavero il farmacista Lomax in pieno mercato. Lomax non ha voluto sporgere denuncia. Un uomo che non vuole sporgere denuncia, Margaret, è un uomo che ha paura di qualcosa di peggio della polizia.
  if $chiave != "":
    > L'apprendista del fabbro mi ha raccontato, dopo due birre, di una chiave senza denti fatta per un piccolo signore, e di una copia fatta per la tenuta. Ho cercato la porta che apre. Non l'ho trovata. Credo che sia lei a dover trovare me.
  if $evDuello:
    > Il mese scorso un ufficiale in congedo ha sfidato a duello un erede della tenuta, per un insulto ricevuto all'osteria da un piccolo uomo con il cappotto nero. La cosa si è chiusa senza feriti. Ti lascio immaginare il resto: il villaggio non ha parlato d'altro per settimane.
  if $internato:
    > Uno degli eredi è stato internato nel manicomio di Lady Carew, nel reparto dei signori. La famiglia ha firmato senza discutere. Gli assegni, da allora, non sono diminuiti.
  > Domani scrivo alla capitale per chiedere un perito calligrafo. Se mi mandano quello che spero, entro qualche anno sapremo almeno chi scrive quegli assegni. Ho paura di saperlo già. Saluta i bambini. Tua, Nell.
  [[Continua... => G1R3]]

:: G1R3 [HUB]
  # **IL SALE IMPURO – Vecchiaia**
  set round = 3
  if $hub != "G1R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $internato:
        ! Andate a **pagina 6** della Village Chronicle, sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}).
      else:
        ! Aprite la Village Chronicle alla sezione **A Time of War** ({icon:S3_ScenarioIcon}) e andate a **pagina 21**.
  set hub = "G1R3"
  include Traguardi
  include VociSale
  if $internato:
    if !$evAsilo:
      block hubTitle:
        ! {icon:Storybook} **Il reparto dei signori – Asylum Program**
      block hubDetails:
        ! Il primo giocatore che manda un suo pezzo all'Asylum Program, a trovare il parente internato, [[clicca qui. -> G1Asilo]]
    block hubTitle:
      ! {icon:Storybook} **La chiromante – Fortune Teller**
    block hubDetails:
      ! Quando un tuo pezzo visita il Fortune Teller, puoi pagare $1 e farti leggere la mano: [[clicca qui. -> G1Chiromante]]
  else:
    if !$evFucina:
      block hubTitle:
        ! {icon:Storybook} **La fucina di notte – Blacksmith**
      block hubDetails:
        ! Il primo giocatore che manda un suo pezzo al Blacksmith [[clicca qui. -> G1Fucina]]
    block hubTitle:
      ! {icon:Storybook} **La chiromante – Traveling Caravan**
    block hubDetails:
      ! La chiromante è partita con la carovana, ma torna in paese con lei. Quando un tuo pezzo visita la Traveling Caravan, puoi pagare $1 e farti leggere la mano: [[clicca qui. -> G1Chiromante]]
  if !$evNozze:
    block hubTitle:
      ! {icon:Storybook} **Le nozze – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G1Nozze]]
  if !$evRonda:
    block hubTitle:
      ! {icon:Storybook} **La ronda – Town Hall**
    block hubDetails:
      ! Il sindaco cerca volontari e denaro per una ronda notturna. Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G1Ronda]]
  if !$evSilas:
    block hubTitle:
      ! {icon:Storybook} **Il notaio al cimitero – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G1Silas]]
  block hubTitle:
    ! **Fine della Generazione**
  block hubDetails:
    > L'Ispettore Haskett ha fatto venire dalla capitale un perito calligrafo, un ometto con gli occhiali spessi e una valigia piena di lenti. Ha chiesto alla famiglia una lettera di ciascuno, e di poter vedere il Journal del padre, alla tenuta, davanti al notaio.
  [[Clicca qui alla Fine della Generazione per continuare... ~> 0]]
  fragment 0:
    ui endOfRound progress="G1R3" next="G1Perizia"

::round G1R3 0
fine: La Vecchiaia della Prima Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook prima della Fine della Generazione.

// Umber in persona propone un patto: una pagina segreta.
:: G1Fucina
  set evFucina = true
  @@ **Questa pagina è segreta: non mostrarla agli altri.**
  # **La fucina di notte**
  > La fucina è chiusa, ma dentro c'è luce. Il fabbro dorme sul banco, con la testa tra le braccia. Accanto al fuoco, seduto su un'incudine come su un trono, c'è un piccolo uomo con il cappotto nero troppo largo. Si scalda le mani e ti sorride, come se ti aspettasse da anni.

  > "Finalmente qualcuno di famiglia", dice. Ha una voce giovane e una risata vecchia. Dalla tasca tira fuori una pagina strappata dal Journal, fitta di formule. "Questa è tua. Te la do in cambio di una firma: un assegno in bianco, con il tuo nome. Non ti costerà niente. Non subito."
  ! Che cosa fai?
  [[Firmi. ~> firma]]
  [[Gli salti addosso. ~> salta]]
  [[Corri a chiamare le guardie. ~> guardie]]
  fragment firma:
    set patto = $patto + 1
    set sospetto = $sospetto + 1
    > Firmi, con la mano che trema. Umber soffia sull'inchiostro, piega l'assegno e lo mette nel taschino, dalla parte del cuore. La pagina che ti dà è scritta nella grafia del padre, quella dritta, quella per bene, ed è la cosa più bella che tu abbia mai letto. Quando alzi gli occhi, l'incudine è vuota.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge) e 2 {icon:Chemical_Icon}. Il giocatore alla tua sinistra mette il tuo Money token su un Luogo a sua scelta: è l'assegno che hai firmato.
  fragment salta:
    > Gli salti addosso. È leggero come un bambino e svelto come un gatto: ti scivola tra le braccia, ti lascia in mano il cappotto vuoto e scappa nel vicolo ridendo. Il cappotto non ha niente nelle tasche. Ha solo un odore, e lo riconosci: tabacco dolce e l'acido del laboratorio. L'odore di tuo padre.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment guardie:
    set haskett = $haskett + 1
    > Quando torni con le guardie, le lanterne e i bastoni, la fucina è buia, il fabbro russa sul banco e sull'incudine c'è soltanto un assegno da un penny, intestato a te, "per il disturbo". Le guardie ridono per tutta la strada del ritorno. L'Ispettore Haskett no: si fa dare l'assegno e lo chiude nel taccuino.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon}. L'Ispettore Haskett si ricorderà della tua famiglia.

:: G1Asilo
  set evAsilo = true
  # **Il reparto dei signori**
  > Il reparto dei signori ha i tappeti, le tende di velluto e le sbarre dipinte di bianco, perché sembrino cornici. Il parente internato è seduto alla finestra, in vestaglia, e scrive lettere che non spedisce a nessuno. Ti saluta con gentilezza, come si saluta un estraneo. Scrive con la mano sinistra.

  > Lady Carew ti accompagna nella visita di persona. Quando la chiamano in corridoio lascia sulla scrivania, aperto, il suo libretto rilegato in pelle.
  ! Che cosa fai?
  [[Leggi il libretto di Lady Carew. ~> libretto]]
  [[Paghi $2 all'infermiere perché il tuo parente esca prima. ~> esce]]
  [[Lasci $1 nella cassetta delle offerte del manicomio. ~> dono]]
  fragment libretto:
    set registroCarew = true
    > Sono pagine di nomi, e accanto a ogni nome una diagnosi e una cifra. Il nome del tuo parente c'è, sottolineato: *caso interessante*. In fondo, su una pagina a parte, i conti del reparto dei signori. Il manicomio non lo pagano le famiglie per bene. Lo paga, da sette anni, un assegno al mese, sempre della stessa cifra, sempre con la stessa firma: *Umber*.

    > Quando Lady Carew rientra, il libretto è chiuso, esattamente dove l'aveva lasciato. Ti sorride. Tu le sorridi. Nessuno dei due ci crede.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment esce:
    > L'infermiere conta le monete senza vergogna. Quella sera il tuo parente torna alla tenuta in una carrozza a nolo, con la vestaglia sotto il cappotto, e chiede subito del laboratorio. A cena usa la forchetta con la destra, come sempre. Quasi sempre.
    block setupEvent next=$hub:
      ! Paga $2. Il giocatore internato riprende subito il suo Scienziato dal Lost.
  fragment dono:
    set carew = $carew + 1
    > Lady Carew vede la moneta cadere nella cassetta e ti ringrazia con un cenno, come si ringrazia chi ha capito le regole. Prima di salutarti ti promette che il tuo parente sarà trattato con ogni riguardo. Lo dice guardando il libretto.
    block setupEvent next=$hub:
      ! Paga $1 e guadagni 1VP. Lady Carew si ricorderà della tua famiglia.

:: G1Silas
  set evSilas = true
  # **Il notaio al cimitero**
  > È notte, e sulla tomba del padre c'è una lanterna. Il notaio Silas Pell è in piedi davanti alla lapide, da solo, con il cappello in mano. È invecchiato molto, in questi anni. Lo vedi tirare fuori dal panciotto una bustina di carta e spargere sulla tomba un pizzico di polvere grigia, con cura, come si sala la minestra.

  > "Ci siamo cascati tutti e due, vecchio mio", dice alla lapide. "Tu di là. Io di qua."
  ! Che cosa fai?
  [[Gli chiedi che cosa vuol dire "S. P. sa". ~> chiedi]]
  [[Aspetti che se ne vada, e raccogli la polvere. ~> polvere]]
  [[Te ne vai senza farti vedere. ~> vai]]
  fragment chiedi:
    set silas = true
    > Il notaio trasale, e la lanterna gli trema in mano. Per un momento sembra sul punto di dirti tutto. Poi si rimette il cappello. "Vostro padre scriveva molte cose", dice. "Non tutte vere, e nessuna per voi. La mia credenza è chiusa, e la chiave la tengo io. Fate in modo che resti così." Se ne va senza augurarti la buona notte.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e $2: il notaio, il giorno dopo, ti manda una busta "per il disturbo". Silas Pell si ricorderà della tua famiglia.
  fragment polvere:
    > Aspetti che la lanterna sparisca oltre il cancello, poi raccogli con un fazzoletto la polvere grigia dalla lapide. Non sa di niente. Nel laboratorio ne sciogli un pizzico in un bicchiere, con il sale della seconda partita di Lomax: il colore diventa rosso, poi viola, e lì si ferma, come se mancasse ancora qualcosa. O come se ce ne fosse troppo poco.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge).
  fragment vai:
    > Torni indietro piano, tra le lapidi, senza far rumore. Alle tue spalle il notaio continua a parlare alla tomba a bassa voce, per molto tempo. Una volta sola, ti sembra, la tomba gli risponde. Ma potrebbe essere stato il vento, o una civetta, o la tua immaginazione.
    block setupEvent next=$hub:
      ! Non succede niente.

// Primo colpo di scena: Umber è il padre.
:: G1Perizia
  # **La perizia**
  ! **Rapporto del perito calligrafo all'Ispettore Haskett – *1877.***
  > Come da Vostra richiesta, il sottoscritto ha esaminato i ventitré assegni raccolti presso le botteghe del villaggio negli ultimi sedici anni, firmati con nomi diversi, e li ha confrontati con le lettere degli eredi della tenuta e con il Journal del loro defunto padre.

  > Le conclusioni sono le seguenti. Primo: gli assegni sono stati scritti tutti dalla stessa mano. Secondo: quella mano non è di nessuno degli eredi, le cui scritture sono, ai fini di questa perizia, sorprendentemente innocue. Terzo: quella mano è la stessa del Journal.

  > La pressione della penna, la *g* chiusa come un nodo, la firma che risale verso destra: tutto coincide, tranne l'inclinazione. Nel Journal la scrittura pende in avanti, come quella di ogni persona per bene; negli assegni pende all'indietro. Il sottoscritto ha visto una cosa simile una volta sola, in un uomo che aveva imparato a scrivere con la sinistra dopo aver perso la destra.
  if $patto > 0:
    set sospetto = $sospetto + $patto
    > Il sottoscritto segnala un'eccezione. Tra gli assegni più recenti ce n'è uno compilato dalla solita mano, ma firmato davvero da un erede, con la sua grafia e la sua inclinazione. Qualcuno, in famiglia, ha firmato per lui.

  > Il sottoscritto aggiunge, senza che gli sia stato chiesto, che uno degli assegni porta la data della settimana scorsa.
  [[Clicca per continuare... => G1Bara]]

:: G1Bara
  # **La bara**
  ! **Verbale dell'Ispettore Haskett – *1877.***
  > Alle due di notte, con l'autorizzazione del magistrato e alla presenza degli eredi e del notaio Silas Pell, abbiamo fatto aprire la tomba del defunto. Il notaio si è opposto fino all'ultimo; poi ha firmato, e si è messo a guardare altrove.

  > La bara era intatta, chiusa con i chiodi del falegname. Dentro, avvolte in un lenzuolo con le iniziali della famiglia, c'erano pietre di fiume, per un peso di circa settanta chili. Sopra le pietre, piegato in quattro, un assegno al portatore firmato *Umber*, con un biglietto nella stessa grafia inclinata: *Il notaio aveva ragione: le circostanze non erano dubbie. Erano false.*
  if $parroco:
    > Il parroco, presente all'apertura, si è fatto il segno della croce e ha detto soltanto: "Pesava come un sasso. Glielo avevo detto."
  if $tomba:
    > Uno degli eredi, che anni fa aveva passato una notte in questo cimitero, ha riconosciuto nel fango intorno alla tomba le stesse impronte di allora: piccole, svelte, fresche.

  > Il medico condotto, interrogato all'alba, ha ammesso di aver firmato il certificato di morte senza vedere il corpo. Era stato pagato con un assegno.

  > **Il padre non è morto. Il padre è Mr. Umber.**
  [[Clicca per continuare... => G1PadreVoto]]

:: G1PadreVoto
  # **Denunciarlo?**
  ui specialEvent
  if $haskett < 0:
    set sospetto = $sospetto + 1
    > L'Ispettore Haskett vi lascia una notte per decidere, e due guardie davanti al cancello. Si ricorda di ogni bugia che le avete detto. Senza il Journal non ha niente che regga in tribunale: una grafia, una bara di pietre, un medico che ha cambiato versione. Con il Journal, avrà un mandato di cattura per un uomo morto.
  else:
    > L'Ispettore Haskett vi lascia una notte per decidere. Senza il Journal non ha niente che regga in tribunale: una grafia, una bara di pietre, un medico che ha cambiato versione. Con il Journal, avrà un mandato di cattura per un uomo morto.
  if $haskett > 1:
    > Prima di andarsene vi stringe la mano, a uno a uno. "Vi ho chiesto la verità, e me l'avete data", dice. "Qualunque cosa decidiate, non lo dimenticherò."
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: consegnate all'Ispettore il Journal del padre.
  ! NAY: lo bruciate, e il padre resta morto per tutti.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G1PadreEsito" mode="Voting"

:: G1PadreEsito
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Il padre viene denunciato. (YAY) ~> denuncia]]
  [[Il Journal brucia. (NAY) ~> copre]]
  fragment denuncia:
    set umber = "braccato"
    set sospetto = $sospetto - 2
    goto G1Lapide
  fragment copre:
    set umber = "libero"
    set sospetto = $sospetto + 1
    goto G1Lapide

:: G1Lapide
  # **La lapide**
  > Le pietre di fiume tornano al fiume. La bara vuota resta nella fossa aperta per tre giorni, sotto la pioggia, finché il custode del cimitero non chiede alla famiglia che cosa farne. La lapide, con il nome del padre e le due date, è ancora al suo posto. Una delle due date, adesso, è una bugia.
  ! Che cosa fate della tomba? *(Decidete insieme.)*
  [[La richiudete com'è, con il nome e le date. ~> richiudi]]
  [[Fate togliere il nome dalla lapide. ~> nome]]
  [[Fate incidere sotto il nome: *Torna presto.* ~> torna]]
  fragment richiudi:
    set lapide = "chiusa"
    > Il custode richiude la fossa e rimette a posto la lapide. Per il villaggio il padre è morto, e resta morto. Le violette, la mattina dopo, sono di nuovo lì.
    block setupEvent next=G1Chiusura:
      ! Non succede niente.
  fragment nome:
    set lapide = "senza nome"
    set sospetto = $sospetto - 1
    > Lo scalpellino cancella il nome a colpi di martello, lettera per lettera. Resta una pietra liscia con due date e una croce. Il villaggio approva: chi non è morto non ha diritto a una tomba. Le violette, la mattina dopo, sono sparite.
    block setupEvent next=G1Chiusura:
      ! Ogni giocatore guadagna 1VP.
  fragment torna:
    set lapide = "torna presto"
    set sospetto = $sospetto + 1
    > Lo scalpellino incide le due parole sotto il nome, con le lettere più piccole delle altre, e chiede due volte se ha capito bene. Il villaggio trova la cosa di pessimo gusto. La mattina dopo, sulla tomba, accanto alle violette, c'è un biglietto: *Ci puoi contare.*
    block setupEvent next=G1Chiusura:
      ! Ogni giocatore guadagna 1 {icon:Creepy_Icon}.

:: G1Chiusura
  # **Fine della Generazione**
  if $umber == "braccato":
    > L'Ispettore Haskett dà la caccia a un morto per due anni. Fa stampare il suo ritratto sui manifesti di tutta la contea, con la scritta RICERCATO e una ricompensa; ma il ritratto è quello di un uomo alto e distinto, e nessuno ha mai visto Umber così. I manifesti finiscono a incartare il pesce.

    > Nell'inverno del 1879, sul ponte, trovano un cappotto nero troppo largo, piegato con cura, con le tasche piene di etichette della farmacia Lomax. Del padre, nient'altro.
  else:
    > Il Journal brucia nel caminetto della biblioteca, una pagina alla volta, mentre l'Ispettore aspetta in carrozza fuori dal cancello. Quando la famiglia le dice che il quaderno è andato perduto anni fa, lei scrive qualcosa sul taccuino e non insiste.

    > L'ultima pagina, sollevata dal calore, vola su per la cappa del camino prima che qualcuno riesca ad afferrarla. Il mattino dopo la trova il fornaio, nella grondaia, e la riporta alla tenuta. È bianca. Sul retro, nella grafia inclinata all'indietro, c'è una sola parola: *grazie*.
  ! **Nota del notaio Ezra Pell.**
  > Gli eredi della prima generazione morirono negli anni seguenti, tutti di morte naturale, tutti nel loro letto; e questa volta mio padre controllò di persona ogni bara, prima che la chiudessero. Gli avvistamenti, invece, continuarono.

  > Mio padre chiuse il fascicolo nel 1880, con una nota a margine: *Caso archiviato*. Molti anni dopo, sotto, ho aggiunto io: *Non ancora.*
  ui endOfGeneration generation=3 text: Rimuovete tutti i pezzi dal tabellone ed eseguite la Fine della Generazione. Rimettete nella riserva i token {icon:StorybookToken} non usati. Gli Avvistamenti {icon:S2_HuntTokenFRONT} sul tabellone tornano accanto al tabellone; i Money token tornano ai giocatori.
  [[Clicca per continuare... => SaleG2Intro]]
