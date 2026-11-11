// Terza Generazione – "La Grande Seduta" (1898–1905).

// Pagina narrata: il testo è uguale per tutti (le varianti sono nella pagina dopo) e senza nomi.
:: G3Intro [INTRO voice]
  # **GENERAZIONE III: La Grande Seduta**
  ! **Telegramma – {$townname}, *marzo 1898.***
  > ULTIMO DELLA FAMIGLIA SEPOLTO IERI STOP TENUTA VOSTRA STOP NOTAIO ATTENDE STOP NON ARRIVATE DOPO IL TRAMONTO STOP

  > Il telegramma raggiunse i nuovi eredi in città lontane, in uffici, laboratori, collegi. Quando scesero dal treno (perché ora anche lì arrivava il treno) trovarono una cittadina che non somigliava più al villaggio delle storie di famiglia: lampioni lungo la strada principale, un ufficio del telegrafo, una banca con le colonne di finto marmo e, nel caffè della piazza, un fonografo che suonava valzer viennesi a chiunque infilasse una moneta.
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G3Citta:
      include AzzeraTraguardi
      include PosaTraguardi

:: G3Citta
  # **La città**
  if $fede >= 3:
    > E c'era il Circolo. Il Circolo dell'Ultima Ora non aveva più bisogno di nascondersi, né di farsi pubblicità: possedeva le pompe funebri, metà degli edifici della piazza e la maggioranza del consiglio comunale. I suoi iscritti portavano all'occhiello un piccolo occhio d'argento, e lo portavano con orgoglio.
  elif $fede <= -3:
    > E c'era la Chiesa. Dopo anni di prediche, processi e scomuniche, il vescovo aveva ottenuto ciò che voleva: il Circolo dell'Ultima Ora era fuorilegge, le sue sedute un reato, e chi parlava con i morti finiva davanti al tribunale ecclesiastico. Padre Benedek, il successore di Padre Anzelm, teneva un registro di nomi; quello della famiglia vi compariva più volte.
  else:
    > E c'era, ancora, la vecchia guerra. Il Circolo dell'Ultima Ora e la parrocchia di Padre Benedek, il successore di Padre Anzelm, si contendevano le anime di {$townname} una per una, con la tenacia di due vicini che litigano per un muro di confine. Il muro, in questo caso, era il velo.

  if $madame == "ospite":
    > Madame Vámos, a sentire la gente, aveva la stessa età di cinquant'anni prima. Nessuno sapeva dove abitasse. Tutti sapevano dove trovarla.
  elif $madame == "ascesa":
    > Di Madame Vámos restavano uno scialle nero, esposto sotto vetro nel Tempio del Circolo, e una sedia vuota che nessuno osava spostare.
  [[Continua... => G3Antenati]]

:: G3Antenati
  # **La seconda Seduta degli Antenati**
  > Ora i morti della famiglia sono due generazioni. La prima notte nella tenuta i colpi ricominciano, puntuali come un orologio, ma più fitti: due ritmi diversi che si sovrappongono, si interrompono, si correggono a vicenda.

  > Quando arrivano le voci, ogni erede ne sente due: quella del genitore, e una più antica, più fioca, conosciuta soltanto nei ritratti. Non sempre vanno d'accordo.
  ! Ogni giocatore, a turno, legge il messaggio dei propri antenati senza mostrarlo agli altri. Può raccontarlo, mentire o tacere.
  [[Clicca per continuare... => G3AntA]]

::for L in A B C D | Fine
:: G3Ant%L%
  if %L.n% > $players:
    goto G3AntFine
  @@ **Passa lo Storybook a {$name%L%}.**
  # **Due voci**
  set voce = either(1, 2)
  if $ins2%L% >= 6 && $ins1%L% >= 6:
    if $voce == 1:
      > Le due voci parlano insieme, una sopra l'altra, della stessa cosa: una formula, un'ossessione, un'idea che ha consumato due vite e adesso cerca la terza. Quando una si ferma per riprendere fiato, l'altra continua la frase.

      > Non litigano. Sono d'accordo su tutto, ed è questo che ti spaventa. All'alba ti accorgi che stai finendo le loro frasi a voce alta.
    else:
      > "È di famiglia", dice la voce più antica, con una specie di orgoglio. "È di famiglia", ripete la voce del tuo genitore, con una specie di scusa.

      > Poi entrambe ti spiegano, per tutta la notte, un'idea che non ti lascerà più. Al mattino non ricordi le parole. Ricordi solo che devi fare qualcosa, e che devi farlo presto.
    block setupEvent next=G3Ant%L.next%:
      set _SetupImage = "CompulsionBack"
      ! Pesca due carte Compulsion e tienine una.
  elif $ins2%L% >= 6:
    if $voce == 1:
      > La voce del tuo genitore è febbrile: parla in fretta, si contraddice, ricomincia da capo, ti chiede di finire un lavoro che non ti spiega. Poi, piano, interviene l'altra voce, più antica: "Calma. Lascia respirare chi è ancora vivo."

      > Per un poco la voce febbrile tace. Ma prima dell'alba torna, da sola, e ti sussurra un'ultima cosa all'orecchio.
    else:
      > Colpi rapidi, nervosi, come di dita che non sanno stare ferme. È la voce che conosci meglio, ma non l'hai mai sentita così: ansiosa, affamata, piena di numeri. La voce più antica prova a coprirla con una vecchia ninna nanna di famiglia, stonata e paziente.

      > Ti addormenti a metà della ninna nanna. Ti svegli con un'idea in testa che non è tua.
    block setupEvent next=G3Ant%L.next%:
      set _SetupImage = "CompulsionBack"
      ! Pesca una carta Compulsion.
  elif $cuo2%L% + $cuo1%L% >= 5:
    if $voce == 1:
      > Le due voci arrivano insieme, e sono serene. Ti raccontano di una folla, dall'altra parte: le famiglie che la tua famiglia ha consolato in cinquant'anni di lutti, e che ora si sono messe in fila per ringraziare. "Non ti lasceranno senza protezione", dice la voce più antica.

      > Al mattino, per la prima volta da quando sei qui, i cani del vicinato ti fanno le feste; e nella cassetta delle lettere c'è una busta senza firma, con dentro del denaro.
    else:
      > Nessun colpo: un fruscio, come di tante persone che entrano in punta di piedi in una stanza. Le voci dei tuoi antenati ti presentano, uno alla volta, decine di sconosciuti: la vedova del mugnaio, un bambino morto di febbre, un minatore, una sarta. Ognuno ti stringe la mano, fredda e leggera. "Ti dobbiamo un favore", dicono.

      > Il giorno dopo, in paese, la gente ti saluta per strada, e il droghiere non vuole essere pagato.
    block setupEvent next=G3Ant%L.next%:
      ! Arretra di 2 caselle sul tracciato {icon:Creepy_Icon} e guadagni $2.
  elif $segreto%L%:
    if $voce == 1:
      > La voce del tuo genitore è bassa, come di chi teme di essere ascoltato. "La promessa al Circolo. Tu non la conosci, ma io sì: me la rivelò chi venne prima di me, e ora tocca a te portarla."

      > Poi la voce più antica, fioca, aggiunge il resto: come si scioglie la promessa, e come la si può far pagare cara a chi l'ha pretesa. Ti fa scrivere tutto sul retro di una fotografia di famiglia.
    else:
      > "Il Circolo busserà", dice la voce più antica. "Busserà a te, perché sono io ad aver firmato." "E tu non aprirai", aggiunge l'altra, "oppure aprirai alle nostre condizioni."

      > Per tutta la notte le due voci ti insegnano le parole esatte, le date, i nomi: abbastanza per sciogliere la promessa, o per ricattare chi la custodisce. Al mattino hai un fascicolo di appunti e un'idea molto chiara di quanto valga.
    block setupEvent next=G3Ant%L.next%:
      ! Guadagni 2 Conoscenza Occulta (Occult Knowledge).
  else:
    if $voce == 1:
      > Le voci sono deboli, lontane, come su una linea del telegrafo disturbata. Distingui il tuo nome, poi una parola che potrebbe essere "attenzione" oppure "pazienza", e poi più niente.

      > Per la tua famiglia il velo è ancora spesso. Forse è una fortuna.
    else:
      > Aspetti a lungo. Alla fine arrivano due colpi lievissimi, uno per ciascuna delle voci che speravi di sentire; e poi un fruscio di carta, come se qualcuno sfogliasse un libro dall'altra parte del muro.

      > Al mattino il Journal è aperto su una pagina di appunti che ti sarà utile.
    block setupEvent next=G3Ant%L.next%:
      ! Guadagni 1 Conoscenza (Knowledge) a scelta.
::endfor

:: G3AntFine
  set voce = 1
  # **Il mattino**
  > La mattina dopo, prima ancora di colazione, qualcuno bussa alla porta principale. Bussa normalmente, per fortuna. È un uomo anziano, con la barba bianca e una borsa da medico, che si presenta come il dottor Lukács, professore all'University e, a suo dire, "l'ultimo uomo ragionevole di {$townname}".

  > Lukács ha settant'anni, una memoria eccellente e un'unica ossessione: dimostrare che a {$townname} nessuno ha mai parlato con i morti. "Ho assistito alle sedute del Circolo per vent'anni, prendendo appunti", dice. "Ho visto tavolini volare e fantasmi fatti di garza e fosforo. Ho raccolto prove. Mi serve solo qualcuno della famiglia disposto ad aiutarmi."
  [[Continua... => G3R1]]

:: G3R1 [HUB]
  # **LA GRANDE SEDUTA – Giovinezza**
  set round = 7
  if $hub != "G3R1":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Aprite la Village Chronicle alla sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}) e andate a **pagina 10**.
      include PreparaFolla
  set hub = "G3R1"
  include Traguardi
  block hubTitle:
    ! {icon:Storybook} **Il dottor Lukács – University**
  block hubDetails:
    ! Il dottor Lukács raccoglie prove contro il Circolo. Quando un tuo pezzo visita la University, puoi aiutarlo: [[clicca qui. -> G3Lukacs]]
  block hubTitle:
    ! {icon:Storybook} **Le pompe funebri – Funeral Home**
  block hubDetails:
    ! Quando un tuo pezzo visita la Funeral Home, [[clicca qui. -> G3Pompe]]
  block hubTitle:
    ! **Evento del primo Round**
  block hubDetails:
    > In piazza aprono negozi nuovi, tutti nello stesso mese, tutti pagati in contanti.
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G3R1" next="G3Facciate"

::round G3R1 7
fine: La Giovinezza della Terza Generazione è finita.
poi: Poi eseguite tutte le azioni di Inizio Round della Maturità prima di continuare.

:: G3Lukacs
  set prove = $prove + 1
  # **Le prove**
  > Nel suo studio all'University il dottor Lukács ha messo insieme un piccolo museo della frode. Ci sono fili di seta nera, sottilissimi, per sollevare un tavolino; un paio di scarpe con il tacco cavo, per bussare sul pavimento senza muovere le mani; una maschera di garza ancora macchiata di fosforo; e un pacco di ricevute di un fabbro, intestate al Circolo dell'Ultima Ora, per "lavori ai muri" in case private.

  > Lo aiuti a catalogare tutto, a confrontare le date, a ricostruire chi sapeva che cosa. È un lavoro lungo, minuzioso, rassicurante. Quando esci, il mondo ti sembra un posto più semplice.
  ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge) e arretra di 1 casella sul tracciato {icon:Creepy_Icon}.
  [[Torna al Round. => $hub]]

:: G3Pompe
  set velo = $velo + 1
  # **Le pompe funebri**
  > Le pompe funebri del Circolo sono le più eleganti della regione: marmo nero, velluto viola, un organo che suona da solo. Qui i morti vengono lavati, profumati, vestiti di bianco e sepolti con un campanello d'argento legato al polso, collegato da un filo a un altro campanello sopra la tomba. "Per poter suonare", spiega il direttore con un sorriso professionale. "Se mai volessero."

  > Nel retrobottega ti mostra il registro delle sepolture. Accanto a diversi nomi, a matita, ci sono una crocetta e una data successiva al funerale: i giorni in cui il campanello ha suonato. Poi ti offre, a prezzo di favore, qualcosa per il tuo laboratorio. Non chiedi da quale cassa venga.
  ! Guadagni 1 {icon:Bodies_Icon} e 1 {icon:Creepy_Icon}.
  [[Torna al Round. => $hub]]

:: G3Facciate
  # **Negozi nuovi**
  ! **Gazzetta di {$townname} – *1901.***
  > **NEGOZI NUOVI, CLIENTI POCHI.** Nell'ultimo mese a {$townname} hanno aperto, una dopo l'altra, alcune botteghe nuove, tutte con le insegne fresche di vernice e le vetrine impeccabili. Le ha pagate in contanti, a quanto risulta al catasto, una società di Budapest di cui nessuno conosce i soci. Nessuna sembra avere molti clienti; tutte restano aperte fino a tardi.

  > Il dottor Lukács, interpellato da questo giornale, non ha dubbi: sono facciate del Circolo dell'Ultima Ora, dietro le quali la società spiritista continua le sue attività lontano da occhi indiscreti. Il Circolo, interpellato a sua volta, ha risposto con un biglietto listato a lutto: "Anche il commercio è una forma di consolazione."
  [[Clicca per continuare... ~> 0]]
  fragment 0:
    block setupEvent next=G3R2:
      set _SetupImage = "S1_Suspicious_Building"
      ! Dalla Scatola di **The Cost of Disease** prendete le **5 Suspicious Building**, mescolatele e mettetene **{$players}** accanto alla Village Chronicle, dal lato del negozio. Sono Luoghi del villaggio come gli altri. Rimettete le altre nella scatola senza guardarle.
      ! **Smascherare:** quando, nello stesso Round, almeno due giocatori diversi hanno messo un pezzo sulla stessa Suspicious Building, alla fine del Round giratela: il retro dice che cosa nascondeva e chi ha aiutato a smascherarla guadagna i VP indicati.

:: G3R2 [HUB]
  # **LA GRANDE SEDUTA – Maturità**
  set round = 8
  if $hub != "G3R2":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      ! Andate a **pagina 11** della Village Chronicle, sezione **The Cost of Disease** ({icon:S1_ScenarioIcon}). Le Suspicious Building restano accanto alla Chronicle.
  set hub = "G3R2"
  include Traguardi
  if $apparato >= 2:
    block hubTitle:
      ! {icon:Storybook} **Il Telegrafo – Perform Experiment**
    block hubDetails:
      ! Il Telegrafo è quasi finito. Quando completi un Esperimento **C**, puoi rinunciare ai suoi VP per finirlo: [[clicca qui. -> G3Telegrafo]]
  else:
    block hubTitle:
      ! {icon:Storybook} **Il Telegrafo – Perform Experiment**
    block hubDetails:
      ! Quando completi un Esperimento **Engineering**, puoi rinunciare ai suoi VP per lavorare al Telegrafo: [[clicca qui. -> G2Contributo]]
  block hubTitle:
    ! **Evento del secondo Round**
  block hubDetails:
    > Le facciate del Circolo resisteranno agli sguardi degli eredi?
  [[Clicca qui alla fine del Round per passare al Round successivo... ~> 0]]
  fragment 0:
    ui endOfRound progress="G3R2" next="G3Conteggio"

::round G3R2 8
fine: La Maturità della Terza Generazione è finita.
poi: Girate le Suspicious Building smascherate, poi continuate con lo Storybook.

:: G3Telegrafo
  set apparato = 3
  # **Il Telegrafo dei Morti**
  > Saldi l'ultimo filo con le mani che tremano. Prima ancora che tu possa girare l'interruttore, il Telegrafo si accende da solo: i vasi di vetro si illuminano uno dopo l'altro, come le finestre di una casa al tramonto, e un ronzio basso riempie il laboratorio, la tenuta, forse l'intera città.

  > L'ago si alza, esita, poi comincia a battere sui tasti d'osso, lento, deciso. Batte un nome: quello della tua famiglia. Poi si ferma, e aspetta, come chi ha suonato un campanello.
  ! Non guadagni i VP dell'Esperimento: guadagni invece 5VP.
  [[Torna al Round. => $hub]]

:: G3Conteggio
  # **Le facciate**
  prompt smascherate number: Quante Suspicious Building sono state smascherate finora?
  if $smascherate >= 2 || $prove >= $players:
    if $madame == "ospite":
      set madame = "smascherata"
    set velo = $velo - 2
    set fede = $fede - 1
    > **LO SCANDALO DEL CIRCOLO.** La Gazzetta pubblica in prima pagina, su sei colonne, le prove raccolte dal dottor Lukács: le ricevute del fabbro, le botteghe smascherate, le confessioni di due ex iscritti. Le iscrizioni al Circolo dell'Ultima Ora crollano in una settimana; in piazza qualcuno lancia sassi contro le sue finestre.

    if $madame == "smascherata":
      > Madame Vámos, convocata dal pretore, non si presenta. Si dice che abbia fatto le valigie; si dice anche che non abbia nessuna valigia da fare.

      > Alla tenuta, quella notte, i colpi alle pareti sono più deboli del solito. Quasi timidi.
    else:
      > Alla tenuta, quella notte, i colpi alle pareti sono più deboli del solito. Quasi timidi.
  elif $smascherate == 0:
    set fede = $fede + 1
    > Nessuno ha toccato le facciate. Le botteghe del Circolo restano aperte fino a tardi, con le vetrine impeccabili e pochi clienti; il dottor Lukács scrive lettere furiose alla Gazzetta, che non le pubblica.

    > Il Circolo, in silenzio, ringrazia: una mattina ogni erede trova sulla soglia un garofano nero, fresco.
  else:
    > Una facciata è caduta, e quello che c'era dietro ha fatto il giro della città in un giorno. Ma le altre restano in piedi, e il Circolo smentisce tutto con grande dignità.

    > {$townname} non sa più a chi credere. La gente va a messa la domenica e alle sedute il giovedì, per non sbagliare.
  [[Clicca per continuare... => G3R3]]

:: G3R3 [HUB]
  # **LA GRANDE SEDUTA – Vecchiaia**
  set round = 9
  if $hub != "G3R3":
    block setup:
      set _SetupImage = "VillageChronicleCover"
      if $velo >= 9:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 21**.
      elif $fede <= -3:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 11**.
      else:
        ! Aprite la Village Chronicle alla sezione **Fear of the Unknown** ({icon:S2_ScenarioIcon}) e andate a **pagina 20**.
      ! Le Suspicious Building restano accanto alla Chronicle.
  set hub = "G3R3"
  include Traguardi
  if $apparato >= 2 && $apparato < 3:
    block hubTitle:
      ! {icon:Storybook} **Il Telegrafo – Perform Experiment**
    block hubDetails:
      ! Quando completi un Esperimento **C**, puoi rinunciare ai suoi VP per finire il Telegrafo: [[clicca qui. -> G3Telegrafo]]
  block hubTitle:
    ! **La Grande Seduta**
  block hubDetails:
    > Alla fine di questa Generazione, tutta la città si siederà intorno allo stesso tavolo.
  [[Clicca qui alla Fine della Generazione per continuare... ~> 0]]
  fragment 0:
    ui endOfRound progress="G3R3" next="G3GrandeSeduta"

::round G3R3 0
fine: La Vecchiaia della Terza Generazione è finita.
poi: Eseguite le azioni di Fine Round, poi continuate con lo Storybook per la Grande Seduta.

:: G3GrandeSeduta
  # **La Grande Seduta**
  ! **Ultimo verbale di seduta – {$townname}, *31 dicembre 1905.***
  > L'ultima notte del 1905 {$townname} si riunisce nella sala grande del municipio: il sindaco, il consiglio, il Circolo, la parrocchia, il dottor Lukács con il suo taccuino e, al centro, la famiglia della tenuta. Duecento persone sedute in cerchi concentrici, le mani intrecciate a quelle dei vicini, le lampade spente. Nessuno ricorda chi l'abbia convocata. Tutti, però, sono venuti.

  > A mezzanotte meno un quarto i colpi cominciano. Non alle pareti: dappertutto. Nel pavimento, nel soffitto, nelle sedie, nel petto di ciascuno. Cinquantasette anni dopo quella prima notte, il velo non è mai stato così sottile.

  if $apparato >= 3:
    > Qualcuno ha portato il Telegrafo dalla tenuta su un carro e l'ha collegato ai fili della luce del municipio. L'ago batte da solo, impaziente, in attesa di istruzioni.
    ! Il Telegrafo è acceso. Ora si può decidere che cosa fargli dire.
    [[Clicca per continuare... => G3VotoTelegrafo]]
  elif $velo >= 9:
    > Nell'aria, al centro della sala, si apre una crepa sottile, come in un vetro. Dall'altra parte c'è una luce fredda, e qualcosa che si muove.
    ! Il velo si strappa sotto le vostre dita.
    [[Clicca per continuare... => G3VotoVelo]]
  else:
    > Il velo trema, ma tiene. Quando le lampade si riaccendono, tutti gli occhi sono sul tavolo del Circolo.
    ! Il velo resiste. Resta da decidere che cosa fare del Circolo.
    [[Clicca per continuare... => G3VotoCircolo]]

:: G3VotoTelegrafo
  # **Che cosa dirà il Telegrafo?**
  ui specialEvent
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: ascoltate il padre.
  ! NAY: usate il Telegrafo per sigillare il velo.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G3EsitoTelegrafo" mode="Voting"

:: G3EsitoTelegrafo
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Ascoltate il padre. (YAY) ~> si]]
  [[Sigillate il velo. (NAY) ~> no]]
  fragment si:
    set scelta = "ascoltare"
    goto G3Possesso
  fragment no:
    set scelta = "sigillare"
    goto G3Possesso

:: G3VotoVelo
  # **Aprire il velo?**
  ui specialEvent
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: aprite il velo.
  ! NAY: resistete.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G3EsitoVelo" mode="Voting"

:: G3EsitoVelo
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Aprite il velo. (YAY) ~> si]]
  [[Resistete. (NAY) ~> no]]
  fragment si:
    set scelta = "aprire"
    goto G3Possesso
  fragment no:
    set scelta = "resistere"
    goto G3Possesso

:: G3VotoCircolo
  # **Il Circolo**
  ui specialEvent
  ! Ogni giocatore prende un Voting token e sceglie in segreto. Quando tutti hanno scelto, rivelate insieme i voti.
  ! YAY: vi unite al Circolo.
  ! NAY: smascherate il Circolo davanti a tutti.
  ! Contate i voti *(in caso di parità decide il Primo Giocatore)*.
  [[Clicca per iniziare la votazione... ~> 0]]
  fragment 0:
    ui bidding next="G3EsitoCircolo" mode="Voting"

:: G3EsitoCircolo
  # **La votazione è chiusa**
  ! **Scegliete il risultato della votazione:**
  [[Vi unite al Circolo. (YAY) ~> si]]
  [[Smascherate il Circolo. (NAY) ~> no]]
  fragment si:
    set scelta = "unirsi"
    goto G3Possesso
  fragment no:
    set scelta = "smascherare"
    goto G3Possesso

// Chi ha l'ectoplasma è il più folle di tutti?
:: G3Possesso
  if $fiala == "":
    goto Punteggio
  # **La fiala**
  ! **{$fiala}**, guarda il tracciato {icon:Insanity_Icon}: il tuo segnalino è il più avanti di tutti (anche a pari merito)?
  [[Sì. ~> si]]
  [[No. ~> no]]
  fragment si:
    set possesso = true
    goto Punteggio
  fragment no:
    set possesso = false
    goto Punteggio

:: Punteggio [END]
  # **Punteggio**
  block setup list=items:
    ! Ogni Miglioria della Tenuta vale 1VP.
    ! Aggiungete i punti delle Migliorie Vanity della Tenuta.
    ! -3VP per ogni Maladjustment ricevuto alla Fine di questa Generazione.
    ! IL GIOCATORE CON PIÙ PUNTI VINCE LA PARTITA.
  [[Clicca per registrare i punteggi per i posteri... ~> 0]]
  fragment 0:
    ui scoreEntry next="SceltaFinale"

:: SceltaFinale
  set winner = $winnerName
  ui generationEndingContinue enabled=true
  if $fede <= -3:
    goto FinaleRogo
  elif $possesso:
    goto FinalePossessione
  elif $scelta == "aprire":
    goto FinaleSquarciato
  elif $scelta == "resistere":
    goto FinaleNebbia
  elif $scelta == "sigillare":
    goto FinaleSilenzio
  elif $scelta == "ascoltare":
    goto FinaleVoce
  elif $scelta == "unirsi":
    goto FinaleSocieta
  else:
    goto FinaleTruffa
