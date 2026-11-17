// Seconda Generazione – "La nebbia" (1873–1881).

// Pagina narrata: il testo è uguale per tutti (le varianti sono nella pagina dopo) e senza nomi.
:: G2Intro [INTRO voice]
  # **GENERAZIONE II: La nebbia**
  ! **Nota del dott. Halász al fascicolo.**
  > La seconda cassa si apre con un salto di diciassette anni. Le carte della prima generazione si fermano nel 1856; le successive cominciano nella primavera del 1873, quando i figli degli eredi presero possesso della tenuta, del laboratorio e del diario, che nel frattempo era diventato due volumi e mezzo.

  > Il villaggio era cresciuto. Al posto delle case di legno c'erano case a graticcio con le travi dipinte, una strada lastricata, un ufficio postale, due locande e un medico. Il parroco era sempre Padre Anzelm, più vecchio e più magro, ma non meno ostinato. E c'era, scrive uno dei nuovi eredi in una lettera alla sorella, "questa cosa che qui chiamano il velo, come se fosse un fatto del tempo, come la pioggia o la nebbia".
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G2Antenati:
      include AzzeraTraguardi
      include PosaTraguardi
      ! Prendete dalla Scatola di **The Cost of Disease** le **Vanity Estate Upgrade** e aggiungetele a quelle disponibili.

:: G2Antenati
  # **La Seduta degli Antenati**
  if $madame == "ospite":
    > Madame Vámos non era invecchiata: così, almeno, giuravano tutti. Il Circolo dell'Ultima Ora non si nascondeva più. Aveva una sede in piazza, una banda per i funerali e duecento iscritti, e quell'anno comprò il terreno dietro il municipio per costruirci un tempio.
  else:
    > Della donna del carro restavano solo le storie, e un'abitudine curiosa: sulle porte delle case di {$townname} compariva ogni tanto un occhio disegnato con il carbone. Nessuno ammetteva di disegnarlo, nessuno lo cancellava. Il Circolo dell'Ultima Ora, si diceva, si riuniva ancora; ma non si sapeva dove, né chi ne facesse parte.

  > I colpi alle pareti erano cessati con l'ultimo funerale della prima generazione, e per diciassette anni la tenuta era stata una casa come le altre: fredda d'inverno, umida d'estate, piena di cose che nessuno osava buttare.

  if $camera == "intatta":
    > Solo la camera del fondatore era rimasta com'era, per volontà scritta: il letto con la forma del corpo, la lampada, la sedia accanto al letto. In diciassette anni la sedia si era avvicinata al letto fino a toccarlo.
  elif $camera == "svuotata":
    > La camera del fondatore, svuotata tanti anni prima, era diventata un laboratorio come gli altri. Solo la vecchia sedia, tornata dalla cucina chissà quando, stava sempre nello stesso angolo, rivolta verso il letto che non c'era più.

  > La prima notte che i nuovi eredi vi dormono, i colpi ricominciano. Ma questa volta, dopo i colpi, vengono le voci; e sono voci che ognuno di loro conosce benissimo, perché sono quelle di chi li ha messi al mondo.
  ! Ogni giocatore, a turno, legge il messaggio del proprio antenato senza mostrarlo agli altri. Può raccontarlo, mentire o tacere.
  [[Clicca per continuare... => G2AntA]]

// L'antenato risponde secondo quello che lo Storybook ha saputo alla fine della Prima Generazione.
::for L in A B C D | Fine
:: G2Ant%L%
  if %L.n% > $players:
    goto G2AntFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **Una voce dall'altra parte**
  set voce = either(1, 2)
  if $ins1%L% >= 6:
    if $voce == 1:
      > La voce arriva prima dei colpi: un bisbiglio fitto, senza pause, che non saluta e non chiede come stai. Parla di formule, di proporzioni, di un errore nel terzo quaderno che va corretto subito, subito, prima che sia tardi. Riconosci la voce di chi ti ha messo al mondo, e riconosci anche il tono: è lo stesso delle notti in cui dal laboratorio non usciva nessuno.

      > "Finisci tu", ripete. "Finisci tu, finisci tu." All'alba hai la mano indolenzita e tre pagine fitte di una calligrafia che non è la tua.
    else:
      > Non sono colpi: è un ticchettio rapido e irregolare, come dita che tamburellano su un tavolo per l'impazienza. Poi la voce, febbrile, a metà di una frase cominciata chissà quando: "...e i numeri non tornano, non tornano mai, ma tu li farai tornare..."

      > Provi a chiedere se soffre. Non ti ascolta; non ti ha mai ascoltato. Quando il ticchettio smette, ti accorgi che stai tamburellando anche tu, con lo stesso ritmo, e non riesci a smettere.
    block setupEvent next=G2Risp%L%:
      set _SetupImage = "CompulsionBack"
      ! Pesca una carta Compulsion.
  elif $cuo1%L% >= 3:
    if $voce == 1:
      > Il colpo è uno solo, lieve, come una mano posata sulla porta. Poi la voce, calma, quasi divertita: ti chiede se mangi abbastanza, se il tetto della serra perde ancora, se ti ricordi della vedova del mugnaio. "Dille che sto bene", dice.

      > Capisci che non parla di sé. Parla di tutte le famiglie che ha consolato in vita, e che adesso, dall'altra parte, le fanno compagnia. Prima di andarsene ti benedice, come faceva quando partivi per un viaggio.
    else:
      > Nella stanza c'è profumo di pane caldo e di lavanda: l'odore della cucina della tenuta, tanti anni fa. La voce non bussa. Parla piano, come accanto al letto di un malato, e ti racconta che dall'altra parte non fa freddo, e che le persone consolate in vita sono venute ad accoglierla.

      > "Hai tempo", dice. "Usalo per i vivi." Al mattino, sul comodino, c'è qualcosa che la sera prima non c'era.
    block setupEvent next=G2Risp%L%:
      ! Guadagni $2 oppure 1 Conoscenza (Knowledge) a scelta.
  elif $patto%L%:
    set segreto%L% = true
    if $voce == 1:
      > La voce è bassa, guardinga, come chi parla in una stanza dove c'è qualcun altro. "Ascolta bene, perché non potrò ripeterlo. Tanti anni fa ho fatto una promessa al Circolo, a un uomo con un garofano nero. Credevo di aver venduto una cosa da niente. Mi sbagliavo."

      > Poi ti dice che cosa aveva promesso, parola per parola, e chi dovrà aprire la porta quando il Circolo busserà: tu. "Non dirlo a nessuno", conclude. "Ma ricordalo. Verrà il giorno in cui ti servirà sapere come si scioglie una promessa."
    else:
      > Prima della voce arriva l'odore: garofani e terra smossa. "Il Circolo ti tiene d'occhio", sussurra. "Tiene d'occhio tutti noi: chi ha firmato e chi è nato da chi ha firmato."

      > Ti racconta della busta, delle pagine scritte da una mano morta, della promessa di aprire una porta. Poi ti dice una cosa che il Circolo non sa che tu sai: la promessa vale per il sangue, ma il sangue può scegliere di non mantenerla. A un prezzo. Quale sia, non fa in tempo a dirlo: i colpi si interrompono a metà.
    block setupEvent next=G2Risp%L%:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge). Lo Storybook si ricorderà di questo segreto.
  elif $colpi%L% == "risposto":
    if $voce == 1:
      > Un colpo, due, uno: lo stesso ritmo che hai sentito raccontare mille volte, a tavola, dalla voce che adesso ti parla. "Quella notte risposi prima di tutti", dice. "La porta si è aperta un poco per me, e non si è più richiusa."

      > Poi, in fretta, come chi teme di essere interrotto, ti detta l'inizio di un esperimento che in vita non ebbe mai il coraggio di tentare. Scrivi finché la candela non si consuma.
    else:
      > La voce non perde tempo con i saluti. "Tu sai rispondere, vero? Una volta per sì, due per no. Te l'ho insegnato io, anche se non lo ricordi: battevo sulla parete della tua culla, e tu ridevi."

      > Un brivido. "Io risposi, la prima notte, e da allora di qua mi sentono tutti. Adesso sentono anche te." Quando la voce tace, sul tavolo c'è lo schema di un esperimento, e sulla parete della camera ci sono segni di nocche, piccoli, all'altezza di una culla.
    block setupEvent next=G2Risp%L%:
      ! Guadagni 1 {icon:Insanity_Icon} e pesca un Esperimento dal mazzo che preferisci.
  else:
    if $voce == 1:
      > Colpi lontani, irregolari, come di qualcuno che bussa in un'altra casa, in un'altra via. Rispondi: non succede niente. Chiami: il silenzio si fa più fitto.

      > Forse chi ti ha messo al mondo non vuole parlarti. Forse non può. Forse, pensi con un sollievo di cui ti vergogni un poco, sta semplicemente riposando in pace.
    else:
      > Aspetti fino all'alba con la candela accesa. Senti i colpi alle pareti delle altre camere, le voci attutite, un pianto, una risata. Alla tua parete, niente.

      > Solo verso le cinque arriva un colpo leggerissimo, uno solo, che potrebbe voler dire sì, oppure essere soltanto il legno che si assesta per il freddo.
    block setupEvent next=G2Risp%L%:
      ! Non succede niente.
::endfor

// Dopo il messaggio: la voce aspetta una risposta (ancora segreta, per lo stesso giocatore).
::for L in A B C D | Fine
:: G2Risp%L%
  # **La risposta**
  > La voce tace, ma non se ne va. La senti aspettare dall'altra parte del muro, paziente, come chi ha fatto una domanda e sa che la risposta arriverà. La candela si è consumata fino al piattino. Fuori comincia a schiarire.
  ! Che cosa fai?
  [[Bussi una volta: sì, sono qui. ~> si]]
  [[Non rispondi, e aspetti che se ne vada. ~> no]]
  fragment si:
    set velo = $velo + 1
    > Bussi una volta, piano, con la nocca. Dall'altra parte, dopo un silenzio lunghissimo, arriva un colpo solo, leggero come una carezza sulla testa. Poi più niente. Per il resto della notte dormi profondamente, senza sogni, come non ti succedeva da anni; e al mattino, sulla parete, all'altezza del tuo cuscino, c'è il segno di una nocca che non è la tua.
    block setupEvent next=G2Ant%L.next%:
      ! Guadagni 1VP.
  fragment no:
    set velo = $velo - 1
    > Resti immobile sotto le coperte, con il fiato trattenuto. La voce aspetta ancora un poco, poi si allontana, di stanza in stanza, come qualcuno che cerca un altro parente a cui parlare. All'alba la casa è silenziosa. Ti senti in colpa, e al tempo stesso hai un peso in meno, come chi ha chiuso a chiave una porta.
    block setupEvent next=G2Ant%L.next%:
      ! Arretra di 1 casella sul tracciato {icon:Creepy_Icon}.
::endfor

:: G2AntFine
  set voce = 1
  # **Il silenzio**
  > All'alba le voci tacciono. A colazione la famiglia è stranamente cortese: ci si passa il burro, si parla del tempo, si evita di guardarsi negli occhi.

  > Ognuno ha sentito qualcosa. Nessuno sa che cosa abbiano sentito gli altri. E tutti, almeno per un momento, hanno pensato di mentire.
  ! Alla fine della colazione qualcuno propone:
  [[Di scrivere nel diario quello che ognuno ha sentito. ~> scrivi]]
  [[Di non parlarne mai più. ~> taci]]
  fragment scrivi:
    set velo = $velo + 1
    > Il diario passa di mano in mano, sul tavolo della colazione, tra le briciole. Ognuno scrive qualche riga, e copre con la mano quello che ha scritto finché non passa il quaderno al vicino. Alla fine, sulla pagina, ci sono più calligrafie di quante persone siedano a tavola.
    [[Continua... => G2R1]]
  fragment taci:
    set velo = $velo - 1
    > La proposta passa senza bisogno di votare. Da quel giorno, alla tenuta, dei morti non si parla a tavola, come non si parla di soldi o di malattie. Ma la sera, nei corridoi, ognuno cammina un po' più vicino al muro, come per sentire meglio.
    [[Continua... => G2R1]]

:: G2R1 [HUB]
  # **LA NEBBIA – Giovinezza**
  set round = 4
  if $hub != "G2R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $madame == "ospite":
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 4**.
      else:
        ! Aprite la Village Chronicle alla sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}) e andate a **pagina 4**.
      include PreparaFolla
  set hub = "G2R1"
  include Traguardi
  if $madame == "ospite":
    block hubTitle:
      ! {icon:Storybook} **Il Tempio del Circolo – Construction Site**
    block hubDetails:
      ! Quando un tuo pezzo visita il Construction Site, paga $3 per finanziare il Tempio del Circolo e [[clicca qui. -> G2Tempio]]
  else:
    block hubTitle:
      ! {icon:Storybook} **La benedizione – Church**
    block hubDetails:
      ! Quando un tuo pezzo visita la Church, puoi pagare $2 per una messa per i tuoi morti: [[clicca qui. -> G2Messa]]
  if !$evMuri:
    block hubTitle:
      ! {icon:Storybook} **Lavori ai muri – Laborer's Union**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Laborer's Union [[clicca qui. -> G2Muri]]
  if !$evTubo2:
    block hubTitle:
      ! {icon:Storybook} **La tomba del nonno – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G2Tubo]]
  if !$evFilo:
    block hubTitle:
      ! {icon:Storybook} **Il filo del telegrafo – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G2Filo]]
  if !$evStagno2:
    block hubTitle:
      ! {icon:Storybook} **Lo stagno prosciugato – Park**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Park [[clicca qui. -> G2Stagno2]]
  if !$evFondamenta:
    block hubTitle:
      ! {icon:Storybook} **Le fondamenta – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G2Fondamenta]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > Nel secondo volume del diario, tra una ricetta e un conto del maniscalco, c'è il disegno di una macchina per parlare con i morti.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G2R1" next="G2Telegrafo"

::round G2R1 4
fine: La Giovinezza della Seconda Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

:: G2Muri
  set evMuri = true
  # **Lavori ai muri**
  > La sede del Laborer's Union è una stanza fumosa sopra la bottega del fabbro, con un tavolo lungo, una bandiera arrotolata e un registro dei lavori appeso a un chiodo. Il fabbro, adesso, è Jóska: un uomo di trent'anni con le spalle larghe, le mani nere e i capelli ancora bruciacchiati sulla fronte, come quando era bambino. È lui a distribuire il lavoro ai muratori del villaggio.

  if $joska == "amico":
    > Ti riconosce dalla faccia, o forse dal nome. "Chi ti ha messo al mondo mi regalò una moneta, una volta", dice, "e mi chiese di insegnargli un gioco. Non l'ho mai dimenticato."
  elif $joska == "offeso":
    > Ti riconosce dal nome, e il sorriso gli si spegne. "Tua madre, o tuo padre, non ricordo, mi fece prendere a schiaffi davanti alla forgia. Avevo sei anni. Certe cose non si dimenticano."
  > Nel registro, tra un tetto da rifare e un camino da pulire, ci sono molte righe uguali, tutte con la stessa intestazione: *Circolo dell'Ultima Ora – lavori ai muri*. Case private, quasi tutte di vedove. Jóska vede dove guardi, e chiude il registro.
  ! Che cosa fai?
  [[Gli offri del denaro perché ti spieghi quei lavori. ~> spiega]]
  [[Lo assumi per controllare i muri della tenuta. ~> tenuta]]
  [[Lo denunci a Padre Anzelm. ~> denuncia]]
  fragment spiega:
    set trucchi = $trucchi + 1
    if $joska == "offeso":
      > Jóska prende il denaro, lo conta e ne chiede altrettanto. Poi, a bassa voce, ti spiega tutto con il disprezzo di un artigiano per un lavoro facile.
    else:
      > Jóska rifiuta il denaro. Poi, a bassa voce, ti spiega tutto, come si restituisce un favore.
    > Un'intercapedine nel muro, larga un palmo, accanto al letto della vedova; un martelletto imbottito appeso a una corda; la corda che scende in cantina, dove un ragazzo pagato due kreuzer a notte aspetta il segnale. "Un colpo per sì, due per no", dice Jóska, e per un attimo sembra di nuovo il bambino dietro la forgia. "Ma alla tenuta non ci ho mai lavorato. I vostri muri bussano da soli. Lo facevano già quando ero piccolo."
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge).
  fragment tenuta:
    set nucleo = true
    > Jóska gira per la tenuta un giorno intero, bussando ai muri con le nocche e con il manico del martello, ascoltando come un medico ascolta un petto malato. I muri sono pieni, dice: mattoni e calce, niente intercapedini, niente corde.

    > Solo nella parete della camera grande, quella che fu del nonno, il martello suona vuoto. Jóska apre un buco, e dentro c'è un rotolo di filo di rame, verde di ossido, avvolto con cura intorno a un nucleo di ferro. Qualcuno lo ha murato lì dentro, tanti anni fa. Sul nucleo, inciso con la punta di un chiodo, c'è un numero: 1848.
    block setupEvent next=$hub:
      ! Guadagni 2 {icon:Gears_Icon}.
  fragment denuncia:
    set joska = "offeso"
    set fede = $fede - 1
    > Padre Anzelm ascolta, annuisce, e la domenica dopo dedica al fabbro mezzo sermone. Il Circolo smette di dargli lavoro; le vedove smettono di salutarlo; i muratori cercano un altro capo.

    > Jóska non dice niente a nessuno. Ma quando passi davanti alla bottega, il martello sull'incudine batte un ritmo che conosci, lento e ostinato: uno, due, uno.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Tubo
  set evTubo2 = true
  # **La tomba del nonno**
  > Il becchino Mihály è ancora lì, più grande e più curvo, con la barba bianca e lo stesso berretto. Ti accompagna alla tomba del nonno, quella con il tubo d'ottone, senza che tu glielo chieda.

  if $tubo == "ascoltato":
    > Il tubo è aperto, e intorno al tumulo l'erba è calpestata. "Vengono di notte", spiega il becchino, "da tutto il paese. Parlano nel tubo. Dicono che il vecchio porta i messaggi agli altri morti, come una posta." Mostra una scatola di latta piena di biglietti piegati. "Alcuni li infilano dentro. Io li tolgo, la mattina. Non li leggo."
  elif $tubo == "sigillato":
    > Il piombo che chiudeva il tubo è ancora lì. Ma non è più a filo dell'ottone: sporge di un dito, gonfio e incrinato, come se qualcosa lo avesse spinto dal basso, con pazienza, per venticinque anni.
  elif $tubo == "lasciato":
    > Il coperchio del tubo non c'è più: lo cercarono a lungo, dopo il quarantesimo giorno, e non lo trovarono. Il campanello invece c'è, e nelle notti senza vento, dice il becchino, suona.
  else:
    > Il tubo è chiuso, come lo chiuse il becchino dopo i quaranta giorni. L'ottone è diventato verde. Mihály dice che nessuno della famiglia, in venticinque anni, si è mai fermato a guardarlo.
  ! Che cosa fai?
  [[Apri il tubo e ascolti. ~> ascolta]]
  [[Lo fai riempire di terra e di calce, per sempre. ~> chiudi]]
  fragment ascolta:
    set velo = $velo + 1
    > Dal tubo sale lo stesso freddo, lo stesso odore di cera. E un suono, questa volta, che non è un colpo: il fruscio regolare di una penna sulla carta, laggiù in fondo, come di qualcuno che scrive senza fermarsi. Ogni tanto la penna si ferma, e si sente soffiare sull'inchiostro.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment chiudi:
    set velo = $velo - 1
    set fede = $fede - 1
    > Mihály riempie il tubo di terra, poi di calce, poi ci versa sopra l'acqua santa che Padre Anzelm gli ha dato per l'occasione. Per finire, toglie il campanello e lo seppellisce accanto alla lapide.

    > La sera, al cimitero, è tutto silenzioso. Alla tenuta, invece, per una settimana intera, i colpi alle pareti sono più rapidi e più forti, come di qualcuno che è rimasto chiuso fuori.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Creepy_Icon} e guadagni 1VP.

:: G2Filo
  set evFilo = true
  # **Il filo del telegrafo**
  > Il Sindaco Bódi, figlio del vecchio Bódi, è un uomo di quarant'anni con i baffi cerati e un orologio d'oro che guarda di continuo. Nel cortile del municipio ci sono le bobine di filo di rame per la linea del telegrafo imperiale, che arriverà a {$townname} entro l'anno; e il Sindaco, a quanto si dice, è l'unico a sapere quante siano davvero.

  if $bodi == "comprato":
    > "Mio padre diceva che la vostra famiglia paga bene e non fa domande", dice, accarezzandosi i baffi. "È una qualità rara."
  elif $bodi == "ricattato":
    > "Mio padre mi ha parlato di voi", dice, senza sorridere. "E di una certa ricevuta. Spero che la vostra memoria sia meno lunga della sua."
  elif $bodi == "chiesa":
    > "Mio padre diceva che la vostra famiglia sta con il parroco", dice, con un sopracciglio alzato. "Mi chiedo che cosa se ne faccia, il parroco, di un telegrafo."
  > Ti mostra le bobine come un mercante mostra la seta. Una, dice, potrebbe anche andare perduta. Le bobine si perdono, nei magazzini.
  ! Che cosa fai?
  [[Compri una bobina sottobanco. ~> compra]]
  [[Torni di notte e la prendi da te. ~> ruba]]
  [[Rifiuti, e glielo dici in faccia. ~> rifiuta]]
  fragment compra:
    set bobina = true
    > Il Sindaco intasca il denaro senza contarlo. La bobina arriva alla tenuta di notte, su un carretto del comune, guidato da un usciere in livrea che si toglie il cappello davanti al cancello.
    block setupEvent next=$hub:
      ! Se puoi, paga $2: guadagni 2 {icon:Gears_Icon}. Altrimenti guadagni 1 {icon:Gears_Icon}: il Sindaco si accontenta di una promessa.
  fragment ruba:
    set bobina = true
    > Entri nel cortile del municipio dopo mezzanotte, con un sacco e una lanterna cieca. La bobina pesa come un uomo. Mentre la trascini fuori, una finestra del primo piano si illumina: dietro il vetro c'è il Sindaco in camicia da notte, che ti guarda, alza la candela in segno di saluto e torna a letto.

    > Il giorno dopo, nel registro del magazzino, la bobina risulta "consegnata alla tenuta, a saldo".
    block setupEvent next=$hub:
      ! Guadagni 2 {icon:Gears_Icon} e 1 {icon:Creepy_Icon}.
  fragment rifiuta:
    > Gli dici che la tua famiglia non compra beni del comune sottobanco. Il Sindaco ride, guarda l'orologio e ti accompagna alla porta con grande cortesia. Il giorno dopo, alla Gazzetta, compare un trafiletto che loda "l'onestà delle famiglie notabili, che il nostro municipio ha l'onore di servire".
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Stagno2
  set evStagno2 = true
  # **Lo stagno prosciugato**
  > Il comune ha deciso di prosciugare lo stagno del parco: troppe zanzare, troppi miasmi, troppe disgrazie. Gli operai aprono la chiusa un lunedì mattina, e per tre giorni l'acqua scende, lenta, scoprendo il fondo nero, che puzza di foglie e di ferro. Mezzo paese viene a guardare, con il fazzoletto sul naso.

  > Sul fondo, nel fango, ci sono centinaia di cose: monete, anelli, ciocche di capelli legate con il nastro, fotografie, lettere chiuse in bottiglie. Per trent'anni le madri e le vedove di {$townname} le hanno buttate nello stagno, di nascosto, per i loro morti. Al centro, nel punto più profondo, c'è un pattino da ghiaccio di bambino, con la cinghia ancora allacciata.
  if $peti == "sepolto":
    > Qualcuno, tra la folla, dice il nome di Peti. La vecchia madre, in prima fila, guarda il pattino senza piangere.
  elif $peti == "corpo":
    > Qualcuno, tra la folla, dice il nome di Peti, e poi guarda verso di te. In paese, certe storie non si dimenticano.
  ! Che cosa fai?
  [[Raccogli le lettere nelle bottiglie e le leggi. ~> lettere]]
  [[Chiedi al parroco di benedire il fondo e di bruciare tutto. ~> brucia]]
  [[Raccogli le monete, prima che lo facciano gli altri. ~> monete]]
  fragment lettere:
    set velo = $velo + 1
    > Le lettere sono indirizzate ai morti, e i morti non le hanno aperte. Le apri tu, una alla volta, la sera, nel laboratorio. Mogli che raccontano ai mariti dei raccolti, madri che chiedono ai figli se hanno freddo, un vecchio che chiede scusa a qualcuno per una lite del 1831. Nell'ultima bottiglia c'è un foglio solo, con la calligrafia di un bambino: *"Non ho freddo."* La bottiglia era sigillata con la ceralacca, e la ceralacca è recente.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment brucia:
    set velo = $velo - 1
    > Il parroco benedice il fondo dello stagno con il secchiello e l'aspersorio, sotto gli sguardi ostili delle vedove, poi fa ammucchiare lettere, fotografie e ciocche di capelli sulla riva e ci dà fuoco. Il fumo è dolce e pesante. Il pattino non brucia: lo seppelliscono nel cimitero, in un angolo, senza nome. Le vedove non te lo perdonano. Le loro figlie, forse, un giorno ti ringrazieranno.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment monete:
    > Ti chini nel fango con un sacco, insieme ai ragazzi del paese e a qualche adulto senza vergogna. Le monete sono di trent'anni di monetazioni diverse, alcune d'argento. Le vedove ti guardano dall'argine, in silenzio. Quella notte, alla tenuta, i colpi alle pareti sono bagnati: lasciano sull'intonaco piccoli aloni d'acqua.
    block setupEvent next=$hub:
      ! Guadagni $2 e 1 {icon:Creepy_Icon}.

:: G2Fondamenta
  set evFondamenta = true
  # **Le fondamenta**
  if $madame == "ospite":
    > Al Builder's Office c'è agitazione: scavando le fondamenta del Tempio del Circolo, gli operai hanno trovato una cassetta di piombo, sepolta a due metri, sotto un sasso squadrato.
  else:
    > Al Builder's Office c'è agitazione: scavando le fondamenta del nuovo ufficio postale, gli operai hanno trovato una cassetta di piombo, sepolta a due metri, sotto un sasso squadrato.
  > Il capomastro la tiene sul tavolo come una bomba. Sul coperchio, incise con un chiodo, ci sono una data e tre lettere: *1828 – C. U. O.* Nessuno ha il coraggio di aprirla. Qualcuno ha pensato di chiamare la famiglia della tenuta, che di queste cose "se ne intende".
  ! Che cosa fai?
  [[La apri. ~> apri]]
  [[La consegni al Circolo, chiusa. ~> circolo]]
  [[La fai riseppellire, dopo averla fatta benedire. ~> seppellisci]]
  fragment apri:
    set velo = $velo + 1
    > Dentro, su un fondo di velluto marcito, ci sono tre ciocche di capelli legate con un nastro nero: una castana, una nera, una bionda. Accanto, un campanello d'argento, senza battaglio. E un foglio piegato, con tre firme e una frase: *"Chi parte per primo, bussi."* Una delle firme è quella che trovi ogni sera sulla prima pagina del diario.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Creepy_Icon}.
  fragment circolo:
    set fede = $fede + 1
    > Porti la cassetta, chiusa, alla sede del Circolo. Ti riceve un signore alto con un garofano nero, che la prende tra le mani come si prende un neonato. "Credevamo di averla persa", dice. "Grazie. Vostro nonno sarebbe contento." Ti accompagna alla porta, e sulla porta ti mette in mano una busta. Dentro c'è denaro, e una ciocca di capelli castani, legata con un nastro nero.
    block setupEvent next=$hub:
      ! Guadagni $2.
  fragment seppellisci:
    set velo = $velo - 1
    > Il parroco benedice la cassetta senza aprirla, con una smorfia, e gli operai la riseppelliscono in un angolo del cimitero, sotto un sasso. Quella notte, alla tenuta, i colpi alle pareti sono tre, sempre tre, in tre punti diversi della casa, come di tre persone che si cercano e non si trovano.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Tempio
  set fede = $fede + 1
  # **Il Tempio**
  > Paghi i muratori in contanti, davanti a tutti. Le fondamenta del Tempio crescono in fretta, più in fretta di quanto dovrebbero: i muratori dicono che di notte qualcuno lavora al posto loro, e che al mattino trovano le pietre già squadrate.

  > Madame Vámos passa a vedere il cantiere. Ti stringe la mano e ti chiama per nome davanti a tutti, come si fa con le persone di famiglia. Le vedove del Circolo, quella sera, accendono una candela per i tuoi morti.
  ! Guadagni 1 Charity token {icon:S1_HeartToken}.
  [[Torna al Round. => $hub]]

:: G2Messa
  set fede = $fede - 1
  # **La messa**
  > Il vecchio Padre Anzelm celebra una messa per i morti della tua famiglia, nella chiesa vuota, con un solo chierichetto che sbadiglia. Alla fine ti prende per un braccio, con una forza che non ti aspettavi. "Li ho seppelliti tutti, i tuoi", dice. "Lascia che restino dove li ho messi."

  > Quella notte, per la prima volta da mesi, nella tua camera non bussa nessuno, e dormi fino a giorno fatto.
  ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
  [[Torna al Round. => $hub]]

:: G2Telegrafo
  # **Il Telegrafo dei Morti**
  include CasoGiocatore
  ! **Diario di {$caso} – *1875.***
  > Nel secondo volume del diario, tra una ricetta per la conservazione dei tessuti e un conto del maniscalco, ho trovato il progetto. Tre tavole disegnate a china, con una cura che il nonno non dedicava a nient'altro. Lo chiama **Telegrafo dei Morti**.

  > Una batteria di vasi di vetro; chilometri di filo di rame avvolti intorno a un nucleo di ferro dolce; una tastiera di ventisei tasti d'osso; e al centro un ago sospeso in un'ampolla piena di un gas che lui chiama "aria del velo". Secondo i suoi calcoli i morti non parlano: modificano, appena un poco, la corrente. Basta un ago abbastanza sensibile per leggerli.

  > Ai margini della terza tavola c'è una nota a matita: *"Non ho avuto il tempo. Lo avranno loro."* Per costruire il primo stadio servono ingranaggi, molti più di quanti ne abbiamo in casa. Ognuno di noi dovrà decidere quanto lavoro sottrarre ai propri esperimenti.
  if $nucleo:
    > Il fabbro Jóska, quando gli mostro le tavole, le studia senza toccarle, con le mani dietro la schiena. Poi dice che il nucleo di ferro dolce, quello del disegno, lo ha già visto: è quello che ha trovato murato nella parete della camera grande, con il numero 1848 inciso sopra.
  if $bobina:
    > Il rame, almeno, non manca: la bobina del telegrafo imperiale è in cantina, avvolta in un telo, e nessuno in municipio l'ha mai cercata.

  [[Clicca per continuare... => G2TelegrafoOfferta]]

:: G2TelegrafoOfferta
  # **Chi contribuisce?**
  ui specialEvent
  ! Ogni giocatore prende in mano in segreto quanti {icon:Gears_Icon} vuole offrire, anche nessuno. Quando tutti sono pronti, rivelate insieme le offerte.
  [[Clicca per iniziare l'offerta... ~> 0]]
  fragment 0:
    ui bidding next="G2TelegrafoEsito" mode="Bidding"

:: G2TelegrafoEsito
  # **Il primo filo**
  prompt contributi number: Quanti {icon:Gears_Icon} avete offerto in tutto?
  if $contributi >= $players:
    set apparato = $apparato + 1
    > Il primo stadio del Telegrafo occupa un'intera parete del laboratorio. La notte in cui lo accendono, i vasi di vetro ronzano, le lampade si abbassano in tutta la casa e l'ago, nell'ampolla, comincia a tremare.

    > Non è il tremito della corrente: è più lento, più ostinato, come un dito che cerca una lettera su una tastiera. Si ferma su un tasto d'osso. Poi su un altro. Prima che qualcuno riesca a leggere la parola, salta un fusibile, e nel buio, per un attimo, qualcuno ride.
    block setupEvent next=G2Nebbia:
      ! Gli {icon:Gears_Icon} offerti tornano nella riserva. Chi ha offerto di più guadagna 3VP (in caso di parità, tutti i pari).
  else:
    > Gli ingranaggi raccolti bastano appena per la base. Il progetto torna nel cassetto, sotto il secondo volume del diario, e i pezzi tornano a chi li aveva offerti.

    > Quella notte i colpi alle pareti sono più lenti del solito, quasi strascicati. Se i morti possono essere delusi, lo sono.
    block setupEvent next=G2Nebbia:
      ! Gli {icon:Gears_Icon} offerti tornano ai giocatori.

:: G2Nebbia
  # **Scende la nebbia**
  ! **Gazzetta di {$townname} – *autunno 1876.***
  > **LA NEBBIA NON SI ALZA.** Da undici giorni una nebbia densa e bianchiccia copre {$townname} dall'alba al tramonto, e dal tramonto all'alba. Il medico condotto parla di miasmi dello stagno; il farmacista, di fumi della tenuta; Padre Anzelm, di un castigo. Le lanterne non illuminano oltre tre passi. Ieri la diligenza è arrivata con sei ore di ritardo: il cocchiere giura di aver girato in tondo tutta la notte intorno al cimitero.

  > Più strane ancora sono le testimonianze che questa redazione continua a ricevere. La signora Tóth ha visto il marito, morto da nove anni, aspettarla all'angolo della farmacia. Il fornaio ha sentito la madre chiamarlo dal forno. Tre bambini hanno giocato tutto il pomeriggio con un amico che nessuno degli adulti ha visto, e di cui nessuno conosce il nome. Si consiglia ai lettori di non uscire senza necessità, e di non rispondere a chi li chiama per nome dalla nebbia.
  if $evStagno2:
    > Alcuni lettori collegano la nebbia al prosciugamento dello stagno del parco. Dove c'era l'acqua, dicono, ora c'è un buco; e i buchi, a {$townname}, si riempiono sempre di qualcos'altro.
  if $evTubo2:
    > Il vecchio becchino Mihály, infine, assicura che la nebbia comincia ogni sera dallo stesso punto: dalla tomba del primo signore della tenuta, quella con il tubo d'ottone.

  ! Alla tenuta, la prima sera di nebbia:
  [[Uscite a vedere. ~> esci]]
  [[Sprangate porte e finestre. ~> spranga]]
  fragment esci:
    set velo = $velo + 1
    > Uscite in giardino con le lanterne, tutti insieme, tenendovi per mano come bambini. A tre passi dalla porta la casa sparisce. A dieci passi sparite anche voi, l'uno per l'altro, e restano soltanto le voci, che si chiamano per nome. Rispondono in troppi. Rientrate dopo un'ora, contandovi sulla soglia, e il conto torna. Per fortuna.
    [[Clicca per continuare... ~> 0]]
  fragment spranga:
    set velo = $velo - 1
    > Chiudete le imposte, mettete le spranghe alle porte, tappate le fessure con gli stracci bagnati. La nebbia resta fuori, contro i vetri, bianca e paziente come un animale che aspetta di entrare. Verso mezzanotte qualcuno bussa al portone, tre volte, educatamente. Nessuno va ad aprire. Al mattino, sulla soglia, ci sono impronte bagnate, che arrivano e non ripartono.
    [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G2R2:
      set _SetupImage = "Creepy_Icon"
      ! Dalla Scatola di **The Cost of Disease** prendete i **Creepy token** {icon:Creepy_Icon}: sono le **Presenze**.
      if $velo >= 6:
        ! Mettete un token {icon:Creepy_Icon} sul **Cemetery**, uno sul **Fortune Teller** e uno sullo **Hospital**.
      else:
        ! Mettete un token {icon:Creepy_Icon} sul **Cemetery** e uno sul **Fortune Teller**.
      ! Quando un giocatore fa un'azione in un Luogo con delle Presenze, guadagna 1 {icon:Creepy_Icon} per ogni token {icon:Creepy_Icon} su quel Luogo.

:: G2R2 [HUB]
  # **LA NEBBIA – Maturità**
  set round = 5
  if $hub != "G2R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $fede >= 0:
        ! Aprite la Village Chronicle alla sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}) e andate a **pagina 8**. Rimettete le Presenze sui Luoghi con lo stesso nome.
      else:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 6**. Rimettete le Presenze sui Luoghi con lo stesso nome; quelle senza Luogo tornano nella scatola.
  set hub = "G2R2"
  include Traguardi
  if $fede >= 0:
    block hubTitle:
      ! {icon:Storybook} **Le sedute private – Pub**
    block hubDetails:
      ! La saletta in fondo al Pub è il luogo delle sedute private. Quando un tuo pezzo visita il Pub, [[clicca qui. -> G2Pub]]
  else:
    block hubTitle:
      ! {icon:Storybook} **I posseduti – Asylum Program**
    block hubDetails:
      ! Padre Anzelm cura i "posseduti" nell'Asylum Program. Quando un tuo pezzo lo visita, [[clicca qui. -> G2Asilo]]
  if !$evGioco:
    block hubTitle:
      ! {icon:Storybook} **Il compagno di giochi – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G2Gioco]]
  if !$evFotografo:
    block hubTitle:
      ! {icon:Storybook} **Il fotografo degli spiriti – Fortune Teller**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Fortune Teller [[clicca qui. -> G2Fotografo]]
  if !$evChierichetto:
    block hubTitle:
      ! {icon:Storybook} **Il chierichetto – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G2Chierichetto]]
  if !$evCoprifuoco:
    block hubTitle:
      ! {icon:Storybook} **Il coprifuoco – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G2Coprifuoco]]
  if !$evCasa:
    block hubTitle:
      ! {icon:Storybook} **La casa nuova – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G2Casa]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > Nella nebbia il velo è sottile come carta bagnata. Qualcuno vuole approfittarne.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G2R2" next="G2GrandeSeduta"

::round G2R2 5
fine: La Maturità della Seconda Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Vecchiaia prima di continuare.

:: G2Gioco
  set evGioco = true
  # **Il compagno di giochi**
  > Nella nebbia il cimitero non ha più confini: le lapidi spuntano dal bianco una alla volta, come denti, e il muretto non si vede. Da qualche parte, tra le tombe, dei bambini giocano a nascondino. Senti la conta, le risate, i passi che corrono sulla ghiaia. Sono cinque. Poi, quando si chiamano per nome, sono sei.

  > Il sesto ha otto anni, i vestiti bagnati e le guance rosee. Nessuno degli altri sa come si chiami; dicono che viene a giocare solo quando c'è la nebbia, e che è il più bravo di tutti a nascondersi.
  if $peti == "sepolto":
    > Lo vedi sparire dietro una lapide piccola, con un angelo di pietra: la lapide che la tua famiglia pagò, tanti anni fa, per il figlio del bottaio.
  elif $peti == "corpo":
    > Lo vedi frugare tra le tombe, una per una, leggendo i nomi con il dito. Un bambino gli chiede che cosa cerca. "La mia", risponde. "Non la trovo."
  elif $peti == "vegliato":
    > Ti torna in mente, chissà perché, una frase che hai sentito raccontare in famiglia: una medium, una veglia, un bambino che "giocherà ancora con gli altri, quando verrà la nebbia".
  ! Che cosa fai?
  [[Giochi con loro. ~> gioca]]
  [[Riporti i bambini a casa. ~> casa]]
  [[Chiami il sesto bambino e gli chiedi chi è. ~> chiedi]]
  fragment gioca:
    set velo = $velo + 1
    > Conti fino a cinquanta con la fronte contro una lapide, come nell'infanzia. Trovi tutti, uno dopo l'altro, tranne lui. Lo cerchi finché la nebbia diventa grigia, poi azzurra, poi nera. Alla fine è lui a trovare te: una mano piccola, fredda come l'acqua di gennaio, ti tocca la spalla. "Tana", dice, e ride. Quando ti volti non c'è nessuno, e i tuoi vestiti sono bagnati fino al gomito.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Insanity_Icon} e 2VP.
  fragment casa:
    set velo = $velo - 1
    > Raduni i bambini e li riporti in paese, uno per uno, alle loro madri. Le madri ti ringraziano, poi guardano i figli, poi la nebbia alle tue spalle, e chiudono la porta più in fretta del necessario. Dei bambini, ne hai riportati cinque. Nessuno ti chiede del sesto.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken}.
  fragment chiedi:
    > Il bambino si avvicina senza paura e ti dice il suo nome: Peti. Poi ti chiede di sua madre. È vecchia, adesso, e vive sola dietro la bottega del bottaio; tu glielo dici, e lui annuisce, come se lo sapesse già. "Dille che non ho più freddo", dice. "Diglielo tu: a me non mi sente."

    > Vai dalla vecchia quella sera stessa. Non ti chiede come tu lo sappia. Ti fa sedere, ti versa da bere, e ascolta tutto senza piangere. Quando esci, la nebbia si è alzata.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken} e 1 {icon:Creepy_Icon}.

:: G2Fotografo
  set evFotografo = true
  # **Il fotografo degli spiriti**
  > Accanto al banco della chiromante c'è una tenda nera nuova, con un'insegna dipinta a mano: **HARTMANN – FOTOGRAFIA DEGLI SPIRITI – VIENNA, PARIGI, LONDRA**. Il signor Hartmann è un uomo piccolo e gentile, con le dita macchiate di nitrato d'argento. Davanti alla tenda ha appeso i suoi ritratti: vedove, soldati, bambini in posa rigida; e dietro di loro, sfocati e trasparenti, i loro morti, con una mano posata sulla spalla dei vivi.

  > "Con questa nebbia", dice, "le lastre vengono come non sono mai venute. Il velo è sottile, qui: la mia macchina lo sente." Ti guarda con l'occhio professionale di chi misura una posa. "Voi, poi, di morti in famiglia ne avete parecchi."
  ! Che cosa fai?
  [[Ti fai fare un ritratto. ~> posa]]
  [[Gli rompi le lastre. ~> lastre]]
  [[Lo paghi perché ti insegni come fa. ~> trucco]]
  fragment posa:
    set foto = "posa"
    set velo = $velo + 1
    > Resti immobile per un minuto intero, con il collo stretto nella morsa di ferro, mentre il fotografo conta a voce alta. Il ritratto è pronto due giorni dopo. Ci sei tu, con la schiena rigida e la faccia pallida; e dietro di te, appena più chiaro della nebbia, c'è chi ti ha messo al mondo, con una mano sulla tua spalla.

    > Riconosci la mano prima del volto: le dita macchiate d'inchiostro, l'anello che è finito nella bara. Il signor Hartmann, quando glielo fai notare, si fa molto serio e non vuole essere pagato.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge).
  fragment lastre:
    set foto = "lastre"
    set fede = $fede - 1
    > Rovesci il tavolo delle lastre, e il vetro si frantuma sulla ghiaia con un rumore di campanelli. Il fotografo non reagisce: ti guarda con una pena infinita, come si guarda un cliente che non ha capito.

    > Raccogliendo i cocci per non lasciarli ai bambini, ne trovi uno più grande degli altri, con un pezzo di ritratto ancora intatto: una spalla, una mano, e un volto che conosci dalle fotografie di famiglia. La lastra è datata tre giorni fa. Nessuno della tua famiglia si è mai fatto ritrarre qui.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e 2VP.
  fragment trucco:
    set foto = "trucco"
    set velo = $velo - 1
    set trucchi = $trucchi + 1
    > Il signor Hartmann ride, conta le monete e ti fa entrare nella tenda. Il trucco è semplice: la lastra viene esposta due volte, una con il cliente e una con il ritratto del morto, che la famiglia stessa gli procura senza saperlo, rispondendo alle sue domande gentili. Un velo di garza davanti all'obiettivo fa il resto.

    > Poi, mentre ti accompagna fuori, si ferma davanti a una lastra appesa ad asciugare. "Questa invece no", dice, a voce bassa. "Questa non l'ho fatta io." Non ti lascia guardarla.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge).

:: G2Chierichetto
  set evChierichetto = true
  # **Il chierichetto**
  > Dopo la messa, mentre esci dalla chiesa, ti corre dietro un ragazzino di dodici anni con la cotta ancora addosso, le orecchie a sventola e l'aria di chi ha pensato a lungo prima di decidersi. Si chiama Benedek, ed è il chierichetto di Padre Anzelm: quello che sbadiglia a tutte le messe dei morti.

  > Ti trascina dietro un pilastro e ti racconta, tutto d'un fiato, che il sagrestano copia di nascosto il registro dei morti, ogni sera, e che il giovedì porta le copie a un signore con un fiore nero all'occhiello. Non solo: il sagrestano ascolta le confessioni dalla sacrestia, attraverso la grata. "Il Circolo sa tutto di tutti", dice. "Per questo i morti, alle sedute, sanno tante cose." Ha paura, e si vede.
  ! Che cosa fai?
  [[Lo dici a Padre Anzelm. ~> parroco]]
  [[Paghi il sagrestano perché riferisca anche a te. ~> paga]]
  [[Dici al ragazzo di farsi gli affari suoi. ~> zitto]]
  fragment parroco:
    set benedek = "amico"
    set velo = $velo - 1
    set trucchi = $trucchi + 1
    set fede = $fede - 1
    > Padre Anzelm caccia il sagrestano il giorno stesso, senza una parola, con un gesto della mano che vale più di una scomunica. Al suo posto prende il ragazzino, che da quel giorno serve messa con le orecchie rosse di orgoglio.

    > Benedek non dimentica chi lo ha ascoltato. Ogni volta che ti incontra si toglie il berretto; e, di tanto in tanto, ti racconta a bassa voce quello che sente in sacrestia.
    block setupEvent next=$hub:
      ! Guadagni 1VP e arretra di 1 casella sul tracciato {icon:Creepy_Icon}.
  fragment paga:
    set benedek = "deluso"
    > Il sagrestano accetta il tuo denaro con la stessa naturalezza con cui accetta quello del Circolo. Da quel giorno sai prima di tutti chi è morto, chi sta morendo e chi ha confessato che cosa; e arrivi dalle famiglie in lutto con una parola di conforto prima ancora del becchino.

    > Benedek ti guarda passare dalla porta della sacrestia, il giovedì, con una faccia che non dimenticherai. Ha capito tutto. Ha dodici anni, e ha appena imparato come va il mondo.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken}.
  fragment zitto:
    set benedek = "deluso"
    > Gli dici che le faccende della sacrestia non sono affar tuo, e che un chierichetto che fa la spia finisce male. Il ragazzino arrossisce, abbassa la testa e torna in chiesa senza una parola.

    > La domenica dopo, alla messa, non sbadiglia più. Ti guarda per tutta la funzione, dall'altare, con gli occhi di un adulto.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Coprifuoco
  set evCoprifuoco = true
  # **Il coprifuoco**
  > Il Sindaco Bódi ha convocato il consiglio in seduta straordinaria. Nella nebbia, dice, la gente esce di notte a cercare i propri morti, e non sempre torna: tre dispersi da settembre, uno trovato all'alba nel cimitero, seduto su una tomba che non era quella di famiglia, a parlare da solo. Propone un coprifuoco: nessuno per strada dal tramonto all'alba, finché la nebbia non si alza.

  > Le famiglie del Circolo protestano: i morti, dicono, parlano soltanto di notte. Il parroco approva. Il Sindaco guarda verso la famiglia della tenuta, come si guarda l'ago di una bilancia.
  ! Che cosa fai?
  [[Sostieni il coprifuoco. ~> si]]
  [[Ti opponi: i vivi hanno diritto di cercare i loro morti. ~> no]]
  fragment si:
    set fede = $fede - 1
    set velo = $velo - 1
    > Il coprifuoco passa con un voto di scarto. Da quella sera le guardie girano con le lanterne e un campanello, e chi viene trovato per strada passa la notte in municipio. Le strade di {$townname}, di notte, sono vuote; ma i guardiani raccontano che il campanello, a volte, suona da solo, e che qualcuno, nella nebbia, risponde.
    block setupEvent next=$hub:
      ! Guadagni 1VP e arretra di 1 casella sul tracciato {icon:Creepy_Icon}.
  fragment no:
    set fede = $fede + 1
    set velo = $velo + 1
    > Il coprifuoco non passa. La sera stessa le strade si riempiono di lanterne: vedove, madri, vecchi che vanno al cimitero in processione, cantando a bassa voce. Alcuni ti fermano per ringraziarti. Una donna ti prende la mano e ti dice che stanotte, finalmente, potrà parlare con suo figlio.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken}.

:: G2Casa
  set evCasa = true
  # **La casa nuova**
  > Al Builder's Office ti aspetta il capomastro Szabó, un uomo onesto e spaventato. Un anno fa ha costruito una casa per una coppia di sposi, in fondo alla via del mulino: mattoni nuovi, travi nuove, niente di vecchio. Da quando è scesa la nebbia, i muri bussano. Gli sposi dormono dalla suocera.

  > Il fabbro Jóska giura di non averci mai messo mano, e Szabó gli crede: ha costruito lui ogni parete, e sa che dentro non c'è niente. "Voi", dice, "siete gli unici che possono dirmi se ho costruito una casa o una porta."
  ! Che cosa fai?
  [[Passi una notte nella casa. ~> notte]]
  [[Fai abbattere il muro che bussa più forte. ~> abbatti]]
  [[Ti fai pagare per una seduta che "pulisca" la casa. ~> seduta]]
  fragment notte:
    set velo = $velo + 1
    > Passi la notte su una sedia, al centro della stanza da letto vuota, con una candela e il diario. A mezzanotte i colpi cominciano, nel muro a nord, quello che guarda verso la tenuta. Li conti. Li trascrivi. All'alba hai tre pagine di lettere che non formano parole, ma che, lette al contrario, formano il nome della via dove sei nato, o nata, tu.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment abbatti:
    set velo = $velo - 1
    > Gli operai abbattono il muro in una mattina. Dentro non c'è niente: mattoni, calce, un nido di topi. I colpi smettono. Gli sposi tornano a casa, il capomastro ti ringrazia con le lacrime agli occhi. Solo il fabbro Jóska, guardando le macerie, fa una smorfia: in mezzo ai mattoni c'è una scarpa di bambino, piccola, bagnata, che nessuno ha messo lì.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment seduta:
    set trucchi = $trucchi + 1
    > Fai una seduta a regola d'arte, come quelle di Madame: candele, mani unite, una voce di gola, un colpo di pedale nascosto sotto il tappeto. Annunci che lo spirito se n'è andato in pace. Gli sposi piangono di gratitudine e ti pagano bene. I colpi, per una settimana, si fermano davvero. Poi ricominciano, più forti; e uno, ti dicono, ha la forma di una risata.
    block setupEvent next=$hub:
      ! Guadagni $3 e 1 {icon:Creepy_Icon}.

:: G2Pub
  @@ **Questa pagina è segreta: non mostrarla agli altri.**
  set velo = $velo + 1
  # **Seduta privata**
  if $madame == "ospite":
    > Nella saletta in fondo al Pub, dietro una tenda di velluto, Madame Vámos riceve chiunque offra un bicchiere all'oste e non faccia domande.
  elif $madame == "ascesa":
    > Madame Vámos non c'è più, ma la sua sedia, nella saletta in fondo al Pub, è ancora al suo posto. Chi ci si siede davanti, con le mani sul tavolino, sente la sua voce.
  else:
    > Nella saletta in fondo al Pub una ragazza pallida, che dice di essere stata allieva della donna del carro, tiene sedute per pochi soldi.

  set caso = either("denaro", "segreto", "padre")
  if $caso == "denaro":
    set latta = true
    > La voce della medium si fa roca, maschile: è un mugnaio morto di colera, dice, che si fidava delle banche ancora meno che dei preti. Ti descrive un mattone smosso dietro la stufa di un mulino abbandonato. Ci vai il giorno dopo, con la nebbia alle ginocchia. Il mattone c'è. Dietro c'è una scatola di latta piena di monete, e nessuno, che tu sappia, verrà mai a reclamarla.
    ! Guadagni $3.
  elif $caso == "segreto":
    > Le mani della medium stringono le tue, a lungo. Poi arriva un nome: quello di chi, in paese, ti teme più di tutti e sparge voci sul tuo conto. È un nome che conosci. Il giorno dopo vai a trovarlo con un cesto di frutta e un sorriso. Le voci, misteriosamente, si spengono.
    ! Arretra di 1 casella sul tracciato {icon:Creepy_Icon}.
  else:
    > A metà di una frase la voce della medium cambia: diventa più bassa, più lenta, con un accento che hai sentito solo nelle storie di famiglia. È il nonno. Ti chiama per nome, il tuo, e ti dice che nella nebbia il velo è sottile come carta bagnata, e che basterebbe un dito per bucarlo. Poi la candela si spegne, e la voce tace.
    ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  ! Prima di andare via:
  [[Lasci un'offerta sul tavolino. ~> offerta]]
  [[Guardi sotto il tavolino, quando nessuno ti vede. ~> sotto]]
  fragment offerta:
    set fede = $fede + 1
    > Lasci una moneta sul velluto. La medium non la guarda; ti trattiene per la mano e ti sussurra un nome, quello di una famiglia del paese che ha appena perso qualcuno e che, dice, ha bisogno di te più di quanto tu abbia bisogno dei morti. Ci vai il giorno dopo. Ha ragione.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken}.
  fragment sotto:
    set velo = $velo - 1
    if $madame == "ospite":
      set trucchi = $trucchi + 1
      > Mentre la medium accompagna fuori un'altra cliente, ti chini sotto il tavolino. Il pedale c'è, come nei racconti di chi frequentava il carro tanti anni fa. Ma è coperto di polvere, e la polvere non è stata toccata da mesi.
    else:
      > Mentre nessuno ti guarda, ti chini sotto il tavolino. Niente pedali, niente fili, niente buchi nell'assito: solo legno vecchio e una scarpa di bambino, piccola, bagnata, che nessuno sa da dove venga.
    block setupEvent next=$hub:
      ! Guadagni 1VP.


:: G2Asilo
  set fede = $fede - 1
  # **La cura**
  > L'Asylum Program è una vecchia caserma imbiancata a calce, con le finestre a sbarre e una croce di ferro sul cancello. Padre Anzelm, ormai curvo, lo dirige con l'aiuto di due suore e di un infermiere enorme che non parla mai. Qui la nebbia ha portato i "posseduti": gente che parla con voci non sue, che scrive in lingue mai studiate, che bussa alle pareti per ore.

  > La cura è severa: bagni gelati, preghiere, cinghie di cuoio, silenzio. Ti fa bene, in qualche modo, vedere quanto è sottile il confine tra loro e te. Ma l'uomo della cella numero sette, quando passi, smette di bussare e ti saluta con il tuo nome, e con la voce di tuo nonno.
  ! Arretra di 2 caselle sul tracciato {icon:Insanity_Icon} e guadagni 1 {icon:Creepy_Icon}.
  [[Torna al Round. => $hub]]

:: G2GrandeSeduta
  # **La Grande Seduta della Nebbia**
  include CasoGiocatore
  ! **Verbale di seduta n. 113 – {$townname}, *notte di Ognissanti, 1878.***
  if $madame == "ospite":
    > Per la notte di Ognissanti Madame Vámos convoca tutto il villaggio nel Tempio del Circolo, o in quello che ne è stato costruito. Vengono in duecento, con le lanterne, attraverso la nebbia. Al centro della sala c'è un tavolo rotondo, con una sedia per ogni erede della tenuta e due in più: una per Madame, una vuota.

    > Madame annuncia che stanotte, con l'aiuto del sangue del fondatore, proverà a evocare lui: l'uomo che per primo scrisse che i veli si sollevano. Il verbale lo redige {$caso}, per volontà della medium, "perché resti scritto da una mano di famiglia".
  else:
    > Senza una medium, la famiglia fa da sé. Nella notte di Ognissanti gli eredi si siedono intorno al vecchio tavolino del laboratorio, quello che il nonno usava per gli esperimenti di magnetismo, con il diario aperto sull'ultima pagina e una sedia vuota a capotavola. Il verbale lo redige {$caso}.

    > Fuori la nebbia preme contro i vetri. Nessuno di loro ha mai condotto una seduta; tutti, però, hanno letto abbastanza per sapere come si fa. È questa, più di tutto il resto, la cosa che fa paura.

  if $foto == "posa":
    > Il fotografo Hartmann, invitato dalla famiglia, ha sistemato la sua macchina in un angolo, con la lastra pronta e il magnesio nel piattino.
  elif $foto == "lastre":
    > Il fotografo Hartmann, nonostante le lastre rotte, si è presentato con una macchina nuova, e nessuno ha avuto il coraggio di mandarlo via.
  if $evCoprifuoco:
    > Per una notte, coprifuoco o no, le strade del paese sono piene di lanterne: chiunque voglia attraversa la nebbia per venire a vedere.
  if $benedek == "amico":
    > Sulla porta, con la cotta sotto il cappotto e un secchiello d'acqua santa, c'è il chierichetto Benedek, mandato da Padre Anzelm "a guardare e a ricordare".

  > A mezzanotte la fiamma della candela, al centro del tavolo, si piega verso la sedia vuota, come per un soffio. È il momento di decidere.
  [[Clicca per continuare... => G2GrandeSedutaVoto]]

:: G2GrandeSedutaVoto
  # **Evocare il padre?**
  ui specialEvent
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: evocate il padre.
  ! NAY: interrompete la seduta.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G2GrandeSedutaEsito" mode="Voting"

:: G2GrandeSedutaEsito
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Evocate il padre. (YAY) ~> si]]
  [[Interrompete la seduta. (NAY) ~> no]]
  fragment si:
    set velo = $velo + 2
    if $madame == "ospite" && $velo >= 8:
      set madame = "ascesa"
    goto G2Ectoplasma
  fragment no:
    set velo = $velo - 1
    goto G2SedutaInterrotta

:: G2Ectoplasma
  # **L'ectoplasma**
  if $madame == "ascesa":
    > Madame Vámos chiude gli occhi e si irrigidisce sulla sedia. Le sue labbra si schiudono, e dalla bocca comincia a uscire una sostanza bianca e luminosa, lenta, come un fumo che pesa. Si allunga sul tavolo verso la sedia vuota e prende la forma di una mano. Poi di un braccio. Qualcuno grida. La luce si fa accecante.

    > Quando torna il buio, sulla sedia di Madame c'è soltanto il suo scialle nero. Del corpo, nessuna traccia. Sul tavolo resta una pozza di sostanza bianca, ancora tiepida, che qualcuno, con mano tremante, raccoglie in una fiala.
  elif $madame == "ospite":
    > Madame Vámos rovescia la testa all'indietro. Dalla sua bocca esce una sostanza bianca e filamentosa, che si raccoglie sul tavolo in una piccola pozza luminosa. La sedia vuota scricchiola, come se qualcuno vi si fosse appena seduto. Poi Madame tossisce, si pulisce le labbra con un fazzoletto e dice, con la sua voce di sempre: "Era qui".

    > Il medico, il giorno dopo, dirà che era garza imbevuta di fosforo. Ma la sostanza che qualcuno raccoglie in una fiala, mesi dopo, brilla ancora.
  else:
    > A mezzanotte la persona più giovane seduta al tavolo comincia a parlare con una voce che non è la sua: bassa, lenta, impaziente. Pronuncia tre parole in una lingua morta, poi tossisce, e dalla sua bocca esce una sostanza bianca e filamentosa che brilla nel buio.

    > Al mattino nessuno ricorda chi abbia preso una fiala dal laboratorio per raccoglierla. Ma la fiala è piena.
  ! Chi ha l'{icon:Insanity_Icon} più alta prende la fiala (in caso di parità, il Primo Giocatore sceglie tra i pari).
  [[{$nameA} ~> A]]
  [[{$nameB} ~> B]]
  if $players > 2:
    [[{$nameC} ~> C]]
  if $players > 3:
    [[{$nameD} ~> D]]
::for L in A B C D
  fragment %L%:
    set fiala = $name%L%
    goto G2Fiala
::endfor

:: G2Fiala
  # **La fiala**
  block setupEvent next=G2Segreti:
    set _SetupImage = "S1_VialToken"
    ! **{$fiala}** prende il **Vial token** dalla Scatola di **The Cost of Disease** e lo tiene davanti a sé fino alla fine del gioco.

:: G2SedutaInterrotta
  # **Le candele si spengono**
  > Qualcuno si alza di scatto e spalanca le imposte. La candela si spegne; la sedia vuota si rovescia da sola, con un tonfo. Per un lungo momento nessuno respira.

  > Poi, fuori, la nebbia si dirada un poco, e per la prima volta da mesi si vede la luna. Qualunque cosa stesse aspettando dall'altra parte del tavolo, se n'è andata. Ma se n'è andata arrabbiata, e per tutto l'inverno, alla tenuta, le porte sbattono da sole.
  [[Clicca per continuare... => G2Segreti]]

:: G2Segreti
  if $madame != "ospite":
    goto G2R3
  # **I segreti di Madame**
  > Qualche settimana dopo la seduta, Madame Vámos manda a ogni erede un biglietto listato a lutto. Non ha più molto tempo, scrive; o forse ne ha troppo. In ogni caso è venuto il momento di lasciare a qualcuno il suo segreto più prezioso: il modo di non morire del tutto.

  > Lo venderà a una persona soltanto: a chi saprà dimostrare di tenerci di più. "I miei figli spirituali", aggiunge in fondo al biglietto, "capiranno che anche l'eternità ha un prezzo."
  ui specialEvent
  ! Ogni giocatore prende in mano in segreto il denaro che vuole offrire. Quando tutti sono pronti, rivelate insieme le offerte. Chi offre di più paga e prende una **Immortality card**; gli altri riprendono il loro denaro.
  [[Clicca per iniziare l'offerta... ~> 0]]
  fragment 0:
    ui bidding next="G2SegretiEsito" mode="Bidding"

:: G2SegretiEsito
  # **Il segreto della vita eterna**
  block setupEvent next=G2R3:
    set _SetupImage = "S1_Immortality"
    ! Chi ha offerto di più pesca a caso una **Immortality card** dalla Scatola di **The Cost of Disease**. Il testo stampato vale così come è scritto.

:: G2R3 [HUB]
  # **LA NEBBIA – Vecchiaia**
  set round = 6
  if $hub != "G2R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $fede >= 0:
        ! Aprite la Village Chronicle alla sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}) e andate a **pagina 9**. Rimettete le Presenze sui Luoghi con lo stesso nome.
      else:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 7**. Rimettete le Presenze sui Luoghi con lo stesso nome.
  set hub = "G2R3"
  include Traguardi
  if $fede >= 0:
    block hubTitle:
      ! {icon:Storybook} **Le sedute private – Pub e Seedy Pub**
    block hubDetails:
      ! Quando un tuo pezzo visita il Pub o un Seedy Pub, [[clicca qui. -> G2Pub]]
  else:
    block hubTitle:
      ! {icon:Storybook} **I posseduti – Asylum Program**
    block hubDetails:
      ! Quando un tuo pezzo visita l'Asylum Program, [[clicca qui. -> G2Asilo]]
  block hubTitle:
    ! {icon:Storybook} **Il Telegrafo – Perform Experiment**
  block hubDetails:
    ! Quando completi un Esperimento **Engineering**, puoi rinunciare ai suoi VP per lavorare al Telegrafo: [[clicca qui. -> G2Contributo]]
  if !$evMulino:
    block hubTitle:
      ! {icon:Storybook} **Il mulino – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G2Mulino]]
  if !$evFossa:
    block hubTitle:
      ! {icon:Storybook} **La fossa del parroco – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G2Fossa]]
  if !$evMedico:
    block hubTitle:
      ! {icon:Storybook} **Il medico condotto – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G2Medico]]
  if !$evBecchini:
    block hubTitle:
      ! {icon:Storybook} **Lo sciopero dei becchini – Laborer's Union**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Laborer's Union [[clicca qui. -> G2Becchini]]
  if !$evMano:
    block hubTitle:
      ! {icon:Storybook} **La mano – Fortune Teller**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Fortune Teller [[clicca qui. -> G2Mano]]
  block hubTitle:
    ! **Fine della Generazione**
  block hubDetails:
    > Il Sindaco Bódi, figlio di quello che sedeva al consiglio nel 1856, è malato, e cerca un erede politico.
  [[Clicca qui alla Fine della Generazione per continuare... ~> 0]]
  fragment 0:
    ui endOfRound progress="G2R3" next="G2Fine"

::round G2R3 0
fine: La Vecchiaia della Seconda Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook prima della Fine della Generazione.

:: G2Mulino
  set evMulino = true
  # **Il mulino**
  > Al Builder's Office il capomastro srotola sul tavolo la pianta della strada nuova, quella che dovrà collegare la piazza alla stazione del telegrafo. Passa proprio sopra il vecchio mulino dei Kovács, fermo da quasi trent'anni, con la ruota marcita e il tetto sfondato. La settimana prossima lo buttano giù.

  if $mulino == "truffa":
    > Il nome ti dice qualcosa. In famiglia si raccontava di una vedova, di una seduta improvvisata dietro il banco del pane, di un mattone dietro la stufa dove non c'era niente.
  elif $mulino == "madame":
    > Il nome ti dice qualcosa. In famiglia si raccontava di una vedova, di Madame Vámos, della settima pala della ruota. La vedova, poi, lasciò il mulino al Circolo; e il Circolo, adesso, lo vende alla strada.
  elif $mulino == "verita":
    > Il nome ti dice qualcosa. In famiglia si raccontava di una vedova onesta e di una gallina; e di un mugnaio che non si fidava di nessuno, nemmeno da morto.
  if $latta:
    > Tu, del resto, sai già che cosa c'era dietro la stufa del mulino: una seduta privata, al Pub, te l'ha fatto trovare. Ma un mugnaio che non si fidava di nessuno, pensi, non avrebbe messo tutto nello stesso posto.
  > "Se volete dare un'occhiata prima che arrivino i picconi", dice il capomastro, "fate pure. Dentro non c'è più niente. Lo dicono tutti."
  ! Che cosa fai?
  [[Cerchi dietro la stufa. ~> stufa]]
  [[Fai dire agli eredi della vedova di cercare loro. ~> eredi]]
  fragment stufa:
    > La stufa è una massa di mattoni anneriti, coperta di nidi di rondine. Il terzo mattone dal basso si muove sotto le dita. Dietro c'è una scatola di latta arrugginita, e dentro un rotolo di monete vecchie e un biglietto scritto con il carbone: *"Per mia moglie. Glielo dica qualcuno, che io non posso."*
    if $mulino == "truffa":
      > Era dietro la stufa. Lo era sempre stato. Una seduta finta, venticinque anni fa, aveva detto la verità; e nessuno era venuto a controllare abbastanza a fondo.
    elif $mulino == "madame":
      > Il che vuol dire, pensi, che i soldi che Madame fece trovare sotto la settima pala erano un'altra cosa. Chi ce li aveva messi? E perché?
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment eredi:
    > Mandi a chiamare i nipoti della vedova Kovács, due ragazzi che fanno i carrettieri, e dici loro di frugare il mulino prima dei picconi. Tornano la sera con una scatola di latta, trovata dietro la stufa, e con gli occhi lucidi. Dentro c'erano i risparmi del nonno, e un biglietto per la nonna.

    > La vedova è morta da anni. I ragazzi portano il biglietto al cimitero e lo seppelliscono accanto a lei, con le loro mani. Poi vengono alla tenuta a ringraziare, con il cappello in mano.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken} e 1VP.

:: G2Fossa
  set evFossa = true
  # **La fossa del parroco**
  > Padre Anzelm sta morendo, e lo sa. Non lo dice a nessuno: va al cimitero con il bastone, ogni mattina, e cammina tra le tombe come un acquirente che visita una casa. Il giorno in cui ti incontra si ferma davanti alla tomba del nonno, la prima della tua famiglia, e indica con il bastone il fazzoletto d'erba accanto.

  > "Questo posto è vostro", dice. "La vostra famiglia lo comprò insieme all'altro, nel 1848. Lo vorrei io." Tossisce, a lungo. "Per tenerlo d'occhio. Trent'anni di prediche, e non mi è mai riuscito di farlo stare zitto. Forse da vicino."
  if $porta == "murata":
    > Poi aggiunge, quasi tra sé: "Il muro della sacrestia tiene. Ma da quando l'avete pagato voi, a volte mi chiedo per chi l'ho fatto murare."
  elif $porta == "aperta":
    > Poi aggiunge, quasi tra sé: "Il registro che qualcuno della vostra famiglia si portò via dalla sacrestia. Spero che qualcuno, in casa vostra, lo abbia letto. Io non ne ebbi mai il coraggio."
  ! Che cosa fai?
  [[Gli concedi il posto accanto al nonno. ~> concedi]]
  [[Rifiuti: quel posto è della famiglia. ~> rifiuta]]
  [[Gli chiedi che cosa sentiva bussare, in tutti questi anni. ~> chiedi]]
  fragment concedi:
    set fede = $fede - 1
    > Il vecchio prete ti stringe la mano con le sue dita secche e calde. Muore a novembre, e lo seppelliscono dove ha chiesto, a un passo dal nonno, con la testa dalla stessa parte. Al funerale c'è tutto il paese, anche le vedove del Circolo, in fondo, con il velo abbassato.

    > La notte dopo il funerale, alla tenuta, nessuno bussa. Né quella dopo, né quella dopo ancora. Poi, la quarta notte, i colpi ricominciano: ma sono due ritmi, adesso, uno sopra l'altro, come due vecchi che litigano.
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment rifiuta:
    set fede = $fede + 1
    > Padre Anzelm annuisce senza offendersi, come se se lo aspettasse. "Avete ragione", dice. "Ognuno resti con i suoi." Lo seppelliscono a novembre dall'altra parte del cimitero, vicino al muro, con la lapide rivolta verso la tomba del nonno.

    > Il Circolo, saputo del tuo rifiuto, ti manda un biglietto listato a lutto con una sola parola: *Grazie.* Non sai bene di che cosa.
    block setupEvent next=$hub:
      ! Guadagni $2.
  fragment chiedi:
    set velo = $velo + 1
    > Il prete ti guarda a lungo, appoggiato al bastone. Poi si siede sulla lapide del nonno, senza rispetto, come ci si siede su una panca. "Il vostro nome", dice. "Lo battevano lettera per lettera. Nei muri della sacrestia, nella cassetta delle elemosine, nel legno del confessionale. Ho fatto trent'anni di esorcismi, e ogni volta che smettevano ricominciavano dal principio, come uno scolaro che ripassa."

    > Si alza, a fatica. "Il posto tenetevelo", aggiunge. "Ho cambiato idea. Non voglio stare vicino a quello che ascolta." Lo seppelliscono a novembre, dall'altra parte del cimitero.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.

:: G2Medico
  set evMedico = true
  # **Il medico condotto**
  > Il medico condotto di {$townname}, adesso, è Béla Lukács: un uomo di cinquant'anni con la barba grigia, gli occhiali tondi e una borsa di cuoio che non lascia mai. Ha preso il posto dello zio, e con il posto anche una certa fama di bestemmiatore, perché dice in pubblico che i morti non tornano e che chi giura di vederli ha il fegato malato.

  if $lukacs == "amico":
    > "La vostra famiglia mi aiutò, una volta", ti dice, "con una busta sigillata. Fu la prima persona ragionevole che incontrai in questo paese. Spero che il buon senso sia ereditario."
  elif $lukacs == "deriso":
    > "La vostra famiglia mi rise in faccia, una volta", ti dice, "al mercato, davanti a tutti. Avevo ventisette anni. Vediamo se ridete anche voi."
  > Sul tavolo della sala del consiglio c'è una petizione: il medico chiede al Sindaco il permesso di ispezionare i luoghi delle sedute "per ragioni d'igiene", e di sequestrare tutto quello che vi troverà di sospetto: fosforo, garza, fili, campanelli. Mancano le firme delle famiglie notabili.
  ! Che cosa fai?
  [[Firmi la petizione. ~> firma]]
  [[Gli dici che le sedute non sono affar suo. ~> rifiuta]]
  fragment firma:
    set lukacs = "amico"
    set velo = $velo - 1
    set trucchi = $trucchi + 1
    set fede = $fede - 1
    > La tua è la prima firma, e la più grande. L'ispezione si fa un martedì di pioggia, con due gendarmi e il medico in testa: fosforo in una credenza, rotoli di garza, un campanello con un filo che sparisce nel soffitto. Il Circolo dice che sono strumenti di pulizia. Il paese ride per una settimana, e poi dimentica.

    > Lukács no. Ti ringrazia, ti prescrive gratis un sonnifero che funziona, e da quel giorno ti saluta per strada come si saluta un collega.
    block setupEvent next=$hub:
      ! Guadagni 1VP e arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
  fragment rifiuta:
    if $lukacs != "amico":
      set lukacs = "deriso"
    set fede = $fede + 1
    > Il medico si toglie gli occhiali, li pulisce con il fazzoletto e se li rimette con molta calma. "Capisco", dice. "È di famiglia." La petizione resta sul tavolo senza le vostre firme, e il Sindaco la mette in un cassetto.

    > Due giorni dopo, sulla soglia della tenuta, trovi un garofano nero e una busta con del denaro, senza biglietto. Il Circolo sa essere riconoscente.
    block setupEvent next=$hub:
      ! Guadagni $2.

:: G2Becchini
  set evBecchini = true
  # **Lo sciopero dei becchini**
  > Alla sede del Laborer's Union c'è una riunione insolita: sei becchini della provincia, con i berretti in mano e la faccia di chi non dorme da settimane. Il vecchio Mihály, il becchino del paese, parla per tutti. Non vogliono più seppellire dopo il tramonto, e non vogliono più chiudere le bare con i chiodi, perché da qualche tempo, quando calano una bara nella fossa, da dentro qualcuno bussa.

  > "Non i morti di adesso", precisa Mihály. "Quelli vecchi, nelle fosse accanto. Bussano per salutare i nuovi." Finché la tenuta, aggiunge, non farà qualcosa per questo, i cimiteri del distretto resteranno chiusi la sera.
  ! Che cosa fai?
  [[Paghi ai becchini il doppio della paga. ~> paga]]
  [[Scavi tu, con chi della famiglia ha il coraggio di venire. ~> scava]]
  [[Chiedi al parroco di benedire le pale. ~> benedici]]
  fragment paga:
    > I becchini accettano il denaro e tornano al lavoro, ma soltanto di giorno, e soltanto in tre per fossa: uno scava, uno tiene la lanterna, uno prega. Mihály ti ringrazia con un cenno. Le sepolture, a {$townname}, diventano rapidissime.
    block setupEvent next=$hub:
      ! Se puoi, paga $2: guadagni 2VP. Altrimenti guadagni 1VP.
  fragment scava:
    set velo = $velo + 1
    > Scavi tu, di notte, con la pala del nonno e una lanterna cieca. La terra è morbida e fredda. Quando la bara del giorno tocca il fondo, dalla fossa accanto arriva un colpo, poi un altro, educati, come di qualcuno che bussa alla porta di un vicino nuovo. Rispondi con il manico della pala. Dopo, per qualche ragione, ti senti ospite in casa d'altri.

    > Mihály, la mattina dopo, ti offre un favore del mestiere, come suo padre fece con i tuoi.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Bodies_Icon} e 1 {icon:Creepy_Icon}.
  fragment benedici:
    set velo = $velo - 1
    > Il parroco benedice le pale, le funi e le lanterne di tutti i becchini del distretto, in una cerimonia breve e un poco ridicola, nel cortile della canonica. Funziona, o così pare: per tutto l'inverno, nei cimiteri, nessuno bussa. I becchini tornano al lavoro, e il parroco, per la prima volta da anni, ti invita a pranzo.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G2Mano
  set evMano = true
  # **La mano**
  > La chiromante del villaggio è una donna grassa e allegra, con le dita piene di anelli e un pappagallo spennacchiato su una gruccia. Per due monete legge la mano a chiunque, e di solito dice cose gentili. Quando prende la tua, però, smette di sorridere.

  > "Avete due linee della vita", dice, seguendole con l'unghia. "Una è la vostra. L'altra comincia prima che nasceste, e non finisce. Non l'ho mai vista su nessuno. Cioè: l'ho vista una volta, su un signore della tenuta, tanti anni fa, quando io ero una ragazza."
  ! Che cosa fai?
  [[Le chiedi che cosa vuol dire. ~> chiedi]]
  [[Le paghi il doppio perché non lo racconti a nessuno. ~> paga]]
  [[Le leggi tu la mano, per vedere come fa. ~> leggi]]
  fragment chiedi:
    set velo = $velo + 1
    > La chiromante esita, poi parla piano, perché il pappagallo non senta. "Vuol dire che qualcuno vive anche in voi", dice. "Qualcuno che non ha finito. Voi siete la sua mano, quando vuole scrivere." Ti richiude le dita a pugno, con delicatezza, come si chiude una lettera. Non vuole essere pagata.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment paga:
    > La chiromante intasca le monete e giura sul pappagallo che non dirà niente a nessuno. Il pappagallo, che ha sentito tutto, la sera stessa ripete al mercato, con la voce della chiromante, *"due linee, due linee"*, finché qualcuno non gli getta sopra un panno.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment leggi:
    set trucchi = $trucchi + 1
    set velo = $velo - 1
    > Le prendi la mano e le dici, con voce grave, che ha un figlio lontano, un dolore alla schiena e un segreto che riguarda il denaro. Lei ride fino alle lacrime: hai indovinato tutto, perché tutti, a quell'età, hanno un figlio lontano, un dolore alla schiena e un segreto che riguarda il denaro. "Avete talento", dice. "Ma le due linee, sulla vostra mano, non le ho inventate."
    block setupEvent next=$hub:
      ! Guadagni 1VP e arretra di 1 casella sul tracciato {icon:Insanity_Icon}.

:: G2Contributo
  set contributi = $contributi + 1
  # **Un filo di rame**
  if $contributi >= $players && $apparato < 2:
    set apparato = $apparato + 1
    set contributi = 0
    if $apparato == 2:
      > Con l'ultimo filo saldato, il secondo stadio del Telegrafo prende vita. I vasi di vetro si illuminano di una luce lattiginosa, la tastiera d'osso vibra, e l'ago non trema più: si sposta deciso da un tasto all'altro e, per la prima volta, compone una parola intera.

      > È un nome. Nessuno in famiglia lo conosce; ma la mattina dopo, al cimitero, lo trovano inciso su una lapide che il becchino giura di non aver mai visto.
    else:
      > Pezzo dopo pezzo, senza aspettare il consenso di nessuno, il primo stadio del Telegrafo è finalmente montato contro la parete del laboratorio. Quando lo accendi, le lampade di tutta la casa si abbassano, e l'ago, nell'ampolla, comincia a tremare. Cerca una lettera. Non la trova ancora.
  else:
    > Saldi un altro tratto di filo, tari l'ago, sostituisci un vaso incrinato. La macchina cresce, ma l'ago resta immobile: mancano ancora dei pezzi. Mentre metti via gli attrezzi, ti sembra di sentire un colpo, impaziente, dall'interno dell'ampolla.
  ! Non guadagni i VP dell'Esperimento: guadagni invece 1 Conoscenza Ingegneristica (Engineering Knowledge).
  [[Torna al Round. => $hub]]

:: G2Fine
  # **L'erede del Sindaco**
  ! **Gazzetta di {$townname} – *1881.***
  > **IL SINDACO E LE SUE AMICIZIE.** Il Sindaco Bódi, che ha ereditato la carica dal padre come altri ereditano un orologio, è malato da tempo e non lo nasconde. Non nasconde nemmeno di cercare, tra le famiglie notabili di {$townname}, qualcuno da proteggere negli anni a venire, e da cui farsi proteggere a sua volta.

  > Corre voce che le famiglie della tenuta abbiano già fatto le loro offerte, in denaro e in favori. Questo giornale non è in grado di confermarlo, e il suo direttore è stato pregato di non insistere.
  if $evFossa:
    > Si ricorda che il defunto Padre Anzelm, nell'ultimo anno, aveva più volte deplorato questo genere di commerci. In attesa di un nuovo parroco, la parrocchia è affidata al vicario del paese vicino, che non si è ancora pronunciato.
  if $lukacs == "amico":
    > Il medico condotto, dottor Lukács, ha fatto sapere che non darà il suo appoggio a nessun candidato "che frequenti i tavolini". La sua lettera è stata accolta con grande interesse e nessuna conseguenza.
  if $evBecchini:
    > Si segnala infine che i cimiteri del distretto, dopo lo sciopero dell'inverno, hanno ripreso il normale servizio. Le sepolture dopo il tramonto restano sospese "fino a nuovo avviso".

  ui specialEvent
  ! Ogni giocatore prende in mano in segreto il denaro che vuole offrire. Quando tutti sono pronti, rivelate insieme le offerte. Chi offre di più paga e prende la **Mayor Coin**; gli altri riprendono il loro denaro.
  [[Clicca per iniziare l'offerta... ~> 0]]
  fragment 0:
    ui bidding next="G2Sindaco" mode="Bidding"

:: G2Sindaco
  # **Il favore del Sindaco**
  ! Chi ha vinto l'offerta?
  [[{$nameA} ~> A]]
  [[{$nameB} ~> B]]
  if $players > 2:
    [[{$nameC} ~> C]]
  if $players > 3:
    [[{$nameD} ~> D]]
::for L in A B C D
  fragment %L%:
    set sindaco = $name%L%
    goto G2SindacoMoneta
::endfor

:: G2SindacoMoneta
  # **La moneta**
  block setupEvent next=G2Domande:
    set _SetupImage = "S1_MayorCoin"
    ! **{$sindaco}** prende la **Mayor Coin** dalla Scatola di **The Cost of Disease**. Nella Terza Generazione, chi ha la Mayor Coin non paga il $1 in più quando visita un Luogo già occupato.

:: G2Domande
  # **Prima del buio**
  > Gli anni della vecchiaia passano in fretta, come passano sempre per chi ha troppo da fare. La nebbia sale e scende con le stagioni, ma non se ne va mai del tutto: si ritira nei fossi, nel cimitero, dietro le serre della tenuta, e aspetta.
  ! Prima di azzerare i tracciati, lo Storybook ha bisogno di sapere come lascia questo mondo ognuno dei vostri scienziati.
  [[Clicca per continuare... => G2DomA]]

::for L in A B C D | Chiusura
:: G2Dom%L%
  if %L.n% > $players:
    goto G2DomChiusura
  # **L'ultima pagina di {$name%L%}**
  prompt ins2%L% number: {$name%L%}, a che casella è il tuo segnalino {icon:Insanity_Icon}?
  prompt cuo2%L% number: {$name%L%}, quanti Charity token {icon:S1_HeartToken} hai?
  set conforto = $conforto + $cuo2%L%
  goto G2Dom%L.next%
::endfor

:: G2DomChiusura
  # **Fine della Generazione**
  ! **Nota del dott. Halász.**
  > Anche le carte della seconda generazione si chiudono con una serie di funerali. Ho voluto controllare le lapidi di persona, una per una, con la lanterna, perché nella nebbia del cimitero (sì, c'è ancora) non si leggeva nulla. Le date sono quelle dei registri. Ma sotto ogni data, in un carattere più piccolo, il lapicida ha inciso anche l'ora; e tutte quelle ore cadono tra la mezzanotte e le tre.

  > Il lapicida, interrogato da un mio collega nel 1902, dichiarò di non aver mai inciso alcuna ora.
  ui endOfGeneration generation=6 text: Rimuovete tutti i pezzi dal tabellone ed eseguite la Fine della Generazione. Rimettete nella riserva i token {icon:StorybookToken} non usati e i Charity token {icon:S1_HeartToken} dei giocatori. Le Presenze {icon:Creepy_Icon} tornano nella scatola.
  [[Clicca per continuare... => G3Intro]]
