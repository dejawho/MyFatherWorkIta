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

  if $fede <= -3:
    > Il Circolo, però, non era morto: si riuniva ancora, a porte chiuse e con gli avvocati migliori della provincia, nel suo Tempio di marmo nero dietro il municipio.
  if $madame == "cacciata":
    > Il Tempio del Circolo, una costruzione bassa di marmo nero dietro il municipio, era stato eretto negli anni Ottanta, molto dopo la partenza della donna del carro. Nessuno sapeva con quali soldi. Tutti avevano un'idea.

  if $madame == "ospite":
    > Madame Vámos, a sentire la gente, aveva la stessa età di cinquant'anni prima. Nessuno sapeva dove abitasse. Tutti sapevano dove trovarla.
  elif $madame == "ascesa":
    > Di Madame Vámos restavano uno scialle nero, esposto sotto vetro nel Tempio del Circolo, e una sedia vuota che nessuno osava spostare.
  ! La prima domenica in città, la famiglia:
  [[Va alla messa di Padre Benedek. ~> messa]]
  [[Va alla seduta del Circolo. ~> seduta]]
  [[Resta a casa, a disfare i bauli. ~> casa]]
  fragment messa:
    set fede = $fede - 1
    > La chiesa è piena a metà. Padre Benedek celebra in fretta, con le orecchie rosse per il freddo, e alla fine viene a stringervi la mano sul sagrato, uno per uno, come si fa con i nuovi parrocchiani. In piazza, dalle finestre del Circolo, qualcuno vi guarda.
    [[Continua... => G3Antenati]]
  fragment seduta:
    set fede = $fede + 1
    > Il salone del Circolo ha le poltrone di velluto, le lampade elettriche schermate di viola e un ritratto del 1828 sopra il camino. Vi fanno sedere in prima fila, senza chiedere chi siete. Durante la seduta il tavolino batte il nome della vostra famiglia, e duecento persone si voltano a guardarvi, sorridendo, come si sorride a un parente arrivato tardi al pranzo.
    [[Continua... => G3Antenati]]
  fragment casa:
    > Restate alla tenuta, tra i bauli e la polvere, ad aprire finestre che nessuno apriva da anni. Nelle tasche dei cappotti appesi all'ingresso trovate biglietti, sassi, un garofano secco, un dente da latte. Nessuno di voi butta via niente.
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
    block setupEvent next=G3Risp%L%:
      set _SetupImage = "CompulsionBack"
      ! Pesca due carte Compulsion e tienine una.
  elif $ins2%L% >= 6:
    if $voce == 1:
      > La voce del tuo genitore è febbrile: parla in fretta, si contraddice, ricomincia da capo, ti chiede di finire un lavoro che non ti spiega. Poi, piano, interviene l'altra voce, più antica: "Calma. Lascia respirare chi è ancora vivo."

      > Per un poco la voce febbrile tace. Ma prima dell'alba torna, da sola, e ti sussurra un'ultima cosa all'orecchio.
    else:
      > Colpi rapidi, nervosi, come di dita che non sanno stare ferme. È la voce che conosci meglio, ma non l'hai mai sentita così: ansiosa, affamata, piena di numeri. La voce più antica prova a coprirla con una vecchia ninna nanna di famiglia, stonata e paziente.

      > Ti addormenti a metà della ninna nanna. Ti svegli con un'idea in testa che non è tua.
    block setupEvent next=G3Risp%L%:
      set _SetupImage = "CompulsionBack"
      ! Pesca una carta Compulsion.
  elif $cuo2%L% + $cuo1%L% >= 5:
    if $voce == 1:
      > Le due voci arrivano insieme, e sono serene. Ti raccontano di una folla, dall'altra parte: le famiglie che la tua famiglia ha consolato in cinquant'anni di lutti, e che ora si sono messe in fila per ringraziare. "Non ti lasceranno senza protezione", dice la voce più antica.

      > Al mattino, per la prima volta da quando sei qui, i cani del vicinato ti fanno le feste; e nella cassetta delle lettere c'è una busta senza firma, con dentro del denaro.
    else:
      > Nessun colpo: un fruscio, come di tante persone che entrano in punta di piedi in una stanza. Le voci dei tuoi antenati ti presentano, uno alla volta, decine di sconosciuti: la vedova del mugnaio, un bambino morto di febbre, un minatore, una sarta. Ognuno ti stringe la mano, fredda e leggera. "Ti dobbiamo un favore", dicono.

      > Il giorno dopo, in paese, la gente ti saluta per strada, e il droghiere non vuole essere pagato.
    block setupEvent next=G3Risp%L%:
      ! Arretra di 2 caselle sul tracciato {icon:Creepy_Icon} e guadagni $2.
  elif $segreto%L%:
    if $voce == 1:
      > La voce del tuo genitore è bassa, come di chi teme di essere ascoltato. "La promessa al Circolo. Tu non la conosci, ma io sì: me la rivelò chi venne prima di me, e ora tocca a te portarla."

      > Poi la voce più antica, fioca, aggiunge il resto: come si scioglie la promessa, e come la si può far pagare cara a chi l'ha pretesa. Ti fa scrivere tutto sul retro di una fotografia di famiglia.
    else:
      > "Il Circolo busserà", dice la voce più antica. "Busserà a te, perché sono io ad aver firmato." "E tu non aprirai", aggiunge l'altra, "oppure aprirai alle nostre condizioni."

      > Per tutta la notte le due voci ti insegnano le parole esatte, le date, i nomi: abbastanza per sciogliere la promessa, o per ricattare chi la custodisce. Al mattino hai un fascicolo di appunti e un'idea molto chiara di quanto valga.
    block setupEvent next=G3Risp%L%:
      ! Guadagni 2 Conoscenza Occulta (Occult Knowledge).
  else:
    if $voce == 1:
      > Le voci sono deboli, lontane, come su una linea del telegrafo disturbata. Distingui il tuo nome, poi una parola che potrebbe essere "attenzione" oppure "pazienza", e poi più niente.

      > Per la tua famiglia il velo è ancora spesso. Forse è una fortuna.
    else:
      > Aspetti a lungo. Alla fine arrivano due colpi lievissimi, uno per ciascuna delle voci che speravi di sentire; e poi un fruscio di carta, come se qualcuno sfogliasse un libro dall'altra parte del muro.

      > Al mattino il diario è aperto su una pagina di appunti che ti sarà utile.
    block setupEvent next=G3Risp%L%:
      ! Guadagni 1 Conoscenza (Knowledge) a scelta.
::endfor

// Dopo il messaggio: le due voci aspettano una domanda (ancora segreta, per lo stesso giocatore).
::for L in A B C D | Fine
:: G3Risp%L%
  # **Una domanda**
  > Le due voci tacciono insieme, come a un segnale. Nel silenzio senti il tuo cuore, il tic dell'orologio del corridoio e, lontanissimo, il ronzio dei fili della luce. Hai il tempo di una domanda sola: lo capisci senza che nessuno te lo dica.
  ! Che cosa chiedi?
  [[Che cosa vuole da noi il fondatore? ~> fondatore]]
  [[Che cosa possiamo fare perché riposiate in pace? ~> pace]]
  fragment fondatore:
    set velo = $velo + 1
    > Le voci esitano. Poi rispondono insieme, con una frase sola, che ripetono finché non la scrivi: *"Che finiate quello che ha cominciato."* Non dicono che cosa. Al mattino, nel diario, la pagina dove l'hai scritta è piegata in quattro, con cura, come una lettera da spedire.
    block setupEvent next=G3Ant%L.next%:
      ! Guadagni 1 Conoscenza (Knowledge) a scelta.
  fragment pace:
    set velo = $velo - 1
    > Le voci ridono, piano, e non è una risata cattiva. "Vivere", dice quella più antica. "Vivere, e non ascoltare troppo." L'altra aggiunge qualcosa sulle finestre, che vanno aperte al mattino, e sul pane, che va mangiato caldo. Poi i colpi si allontanano, e la notte finisce come finiscono le notti normali.
    block setupEvent next=G3Ant%L.next%:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
::endfor

:: G3AntFine
  set voce = 1
  # **Il mattino**
  > La mattina dopo, prima ancora di colazione, qualcuno bussa alla porta principale. Bussa normalmente, per fortuna. È un uomo anziano, con la barba bianca e una borsa da medico, che si presenta come il dottor Lukács, professore all'University e, a suo dire, "l'ultimo uomo ragionevole di {$townname}".

  > Lukács ha settant'anni, una memoria eccellente e un'unica ossessione: dimostrare che a {$townname} nessuno ha mai parlato con i morti. "Ho assistito alle sedute del Circolo per vent'anni, prendendo appunti", dice. "Ho visto tavolini volare e fantasmi fatti di garza e fosforo. Ho raccolto prove. Mi serve solo qualcuno della famiglia disposto ad aiutarmi."
  if $lukacs == "amico":
    > Poi ti guarda meglio, e sorride sotto la barba. "La vostra famiglia mi ha aiutato già, una o due volte", dice. "Ho buona memoria per le persone ragionevoli. Ce ne sono state poche."
  elif $lukacs == "deriso":
    > Poi ti guarda meglio, e il sorriso gli si raffredda. "La vostra famiglia non mi ha mai preso sul serio", dice. "Non sono venuto a chiedere scuse. Sono venuto a darvi un'occasione."
  ! Che cosa rispondi?
  [[Accetti di aiutarlo. ~> si]]
  [[Gli dici che la famiglia non tradisce il Circolo. ~> no]]
  [[Gli dici che ci penserai. ~> forse]]
  fragment si:
    set trucchi = $trucchi + 1
    set fede = $fede - 1
    > Il dottore ti stringe la mano con una forza sorprendente per la sua età, e ti lascia un biglietto da visita con l'indirizzo del suo studio all'University. "Venite quando volete", dice. "Di giorno, possibilmente."
    [[Continua... => G3R1]]
  fragment no:
    set fede = $fede + 1
    > Lukács non si offende. Si rimette il cappello, ti augura una buona giornata e scende la scalinata con passo lento. In fondo, si volta. "Il Circolo", dice, "non ha mai avuto bisogno della vostra fedeltà. Ha bisogno del vostro sangue. Pensateci."
    [[Continua... => G3R1]]
  fragment forse:
    > Il dottore annuisce, come chi è abituato ad aspettare. "Ci ho messo cinquant'anni", dice. "Posso aspettare ancora un poco." Ti lascia il suo biglietto da visita sul tavolo dell'ingresso, sotto il vaso dei fiori.
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
  if !$evArchivio:
    block hubTitle:
      ! {icon:Storybook} **Il muro della sacrestia – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G3Archivio]]
  if !$evConto:
    block hubTitle:
      ! {icon:Storybook} **Il conto più vecchio – National Bank**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla National Bank [[clicca qui. -> G3Conto]]
  if !$evMargini:
    block hubTitle:
      ! {icon:Storybook} **Il libretto francese – Public Library**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Public Library [[clicca qui. -> G3Margini]]
  if !$evCilindro:
    block hubTitle:
      ! {icon:Storybook} **Il cilindro di cera – Laborer's Union**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Laborer's Union [[clicca qui. -> G3Cilindro]]
  if !$evCensimento:
    block hubTitle:
      ! {icon:Storybook} **Il censimento – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G3Censimento]]
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

  if $terreno == "venduto":
    > L'edificio sorge sul prato accanto al cimitero, quello delle ortiche e delle capre del becchino, che la tua famiglia vendette mezzo secolo fa a una società di persone riservate. Dal campanile senza campana partono decine di fili sottili, tesi fino alle tombe.
  elif $terreno == "chiesto":
    > L'edificio lo riconosci prima ancora di entrare: è quello del disegno che la tua famiglia copiò a memoria cinquant'anni fa, con il campanile senza campana e i fili tesi fino alle tombe, come le corde di un'arpa.
  elif $terreno == "rifiutato":
    > L'edificio sorge dall'altra parte del cimitero, sul terreno che il Circolo comprò quando la tua famiglia rifiutò di vendere il suo. Dal campanile senza campana partono decine di fili sottili, tesi fino alle tombe.

  > Nel retrobottega ti mostra il registro delle sepolture. Accanto a diversi nomi, a matita, ci sono una crocetta e una data successiva al funerale: i giorni in cui il campanello ha suonato. Poi ti offre, a prezzo di favore, qualcosa per il tuo laboratorio. Non chiedi da quale cassa venga.
  ! Guadagni 1 {icon:Bodies_Icon} e 1 {icon:Creepy_Icon}.
  [[Torna al Round. => $hub]]

:: G3Archivio
  set evArchivio = true
  # **Il muro della sacrestia**
  > Padre Benedek è un uomo alto e ossuto, con le orecchie a sventola di quando era chierichetto e la tonaca lisa ai gomiti. Da quando è parroco tiene un registro: i nomi di chi frequenta il Circolo, le date delle sedute, le offerte, le morti sospette. Il registro è diventato tre casse, e le tre casse non stanno più in canonica.

  if $benedek == "amico":
    > Ti accoglie come un vecchio alleato. "La vostra famiglia mi diede ascolto, quando avevo dodici anni e nessuno mi credeva", dice. "Adesso tocca a me ascoltare voi."
  elif $benedek == "deluso":
    > Ti accoglie con una cortesia fredda e precisa. "Mi ricordo della vostra famiglia", dice. "Avevo dodici anni. Ho imparato molto, quel giorno."
  > Ti porta nella sacrestia vecchia, davanti a un muro di mattoni intonacato alla meglio, nascosto da un armadio di noce. "Qui dietro c'è un ripostiglio murato al tempo di Padre Anzelm. Nessuno ci guarda da cinquant'anni, e nessuno ci guarderà per altri cinquanta. Voglio metterci le casse. Mi serve qualcuno che paghi il muratore, e che non lo dica a nessuno."
  if $porta == "aperta":
    > Tu sai, dai racconti di famiglia, che cosa c'è sull'interno di quella porta: centinaia di segni di nocche.
  ! Che cosa fai?
  [[Paghi il muratore, e ci metti anche le carte di famiglia. ~> famiglia]]
  [[Paghi il muratore, ma le carte di famiglia restano a casa. ~> paga]]
  [[Non vuoi averci niente a che fare. ~> no]]
  fragment famiglia:
    set archivio = true
    set fede = $fede - 1
    > Il muratore apre il muro in un'ora. Il ripostiglio è vuoto e asciutto; sull'interno della porticina ci sono i segni di nocche, scuriti dal tempo, e nessuno ne parla. Ci sistemate le tre casse del parroco e, accanto, altre tre: i diari, i verbali e le lettere della tua famiglia, cinquant'anni di carte che in casa nessuno aveva più il coraggio di rileggere.

    > Il muratore richiude in fretta, male, con i mattoni che avanzano. Padre Benedek benedice il muro, poi ci rimette davanti l'armadio. "Qualcuno, un giorno, le troverà", dice. "Speriamo che sia una persona paziente."
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment paga:
    > Il muratore apre il muro, ci sistemate le casse del parroco, il muratore richiude. Tu guardi tutto dalla soglia con le mani in tasca. Le carte della tua famiglia, quella sera, sono ancora nello studio della tenuta, nel baule ai piedi della scrivania. Ti sembra più prudente. Ti sembra anche, mentre chiudi il baule, di sentire bussare dall'interno.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.
  fragment no:
    set fede = $fede + 1
    > Dici al parroco che le faccende della parrocchia non ti riguardano. Padre Benedek non insiste. Trova un altro muratore e un altro finanziatore, e del muro della sacrestia non si parla più. Il Circolo, invece, ne parla: la sera stessa un garofano nero è infilato nella maniglia della tenuta.
    block setupEvent next=$hub:
      ! Guadagni $2.

:: G3Conto
  set evConto = true
  # **Il conto più vecchio**
  > La National Bank occupa il palazzo con le colonne di finto marmo, quello che ha preso il posto della vecchia Bank di una stanza sola. Il direttore è un giovane con la scriminatura perfetta e un registro rilegato in pelle che sembra più vecchio di lui. È il registro del conto più vecchio della banca: quello del fondatore della vostra famiglia, aperto nel 1828 e mai chiuso.

  > Da settant'anni, il primo di ogni mese, arriva da Vienna, poi da Budapest, un versamento firmato con tre iniziali: C. U. O.
  if $denaro == "preso":
    > E da cinquant'anni, il secondo giorno di ogni mese, qualcuno della tua famiglia passa a ritirarlo. "Una regolarità ammirevole", dice il direttore, senza ironia. "Come una rendita."
  elif $denaro == "restituito":
    > Dopo che la tua famiglia lo rifiutò, il mittente smise di chiedere che fosse restituito. Il denaro si è accumulato su un conto sospeso, con gli interessi, per mezzo secolo. Il direttore te ne mostra il saldo, e lo fa con una certa reverenza.
  elif $denaro == "chiesto":
    > Accanto a ogni versamento c'è lo stesso garofano nero disegnato a inchiostro, e lo stesso nome, *O. Garai*, con la stessa pressione della penna, dal 1828 a stamattina. Il presidente del Circolo dell'Ultima Ora, ti dice il direttore abbassando la voce, si chiama così.
  ! Che cosa fai?
  [[Prelevi tutto. ~> preleva]]
  [[Fai chiudere il conto, per sempre. ~> chiudi]]
  [[Segui il denaro: chiedi dove finisce il resto. ~> segui]]
  fragment preleva:
    set fede = $fede + 1
    > Il direttore conta il denaro in una stanza a parte, con due impiegati e una porta blindata. Esci con una borsa di cuoio piena e la sensazione, che non riesci a scrollarti di dosso, che qualcuno ti abbia appena pagato per qualcosa. Per che cosa, lo saprai alla fine.
    block setupEvent next=$hub:
      ! Guadagni $4.
  fragment chiudi:
    set fede = $fede - 1
    > Firmi la chiusura del conto. Il direttore esita, poi tira una riga sotto l'ultima cifra, con il righello, e scrive *estinto* in bella calligrafia. La penna gli sputa una goccia d'inchiostro sulla pagina, proprio sopra la parola.

    > Il primo del mese successivo, alla National Bank, arriva da Budapest un versamento intestato a un conto che non esiste più. La banca lo respinge. Ne arriva un altro, il giorno dopo. Poi un altro.
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment segui:
    set trucchi = $trucchi + 1
    > Il direttore, lusingato di essere preso sul serio, ti mostra i giri: una società di Budapest, la stessa che ha comprato i negozi nuovi della piazza; poi le pompe funebri del Circolo; poi un fabbro, un farmacista, un fotografo, un sagrestano in pensione. Cinquant'anni di stipendi. Non sono le spese di una società spiritista: sono quelle di un teatro.

    > Copi tutto su un taccuino. Uscendo, ti accorgi che una pagina del registro, quella del 1848, è stata strappata. Il direttore giura che ieri c'era.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge) e 1VP.

:: G3Margini
  set evMargini = true
  # **Il libretto francese**
  > Alla Public Library, nella sala dei fondi antichi, la bibliotecaria ti consegna con i guanti un libretto in ottavo, rilegato in cartone: *Des tables parlantes et des esprits frappeurs*, Parigi, 1827. Viene, dice, dalla biblioteca del fondatore della vostra famiglia, venduta all'asta per pagare i debiti nel 1857. È il libretto che, la prima notte, qualcuno vide sullo scaffale del padre.

  > I margini sono fitti di appunti, in due calligrafie. Una è quella del diario. L'altra è minuta, elegante, femminile. Le due mani si rispondono, si correggono, si prendono in giro. In fondo all'ultima pagina, sotto la data del 1828, ci sono tre nomi uno sotto l'altro, come in un atto: quello del fondatore, *Eszter Vámos* e *O. Garai*. E sopra, sottolineate, tre parole: *Circolo dell'Ultima Ora*.
  ! Che cosa fai?
  [[Strappi l'ultima pagina, per il buon nome della famiglia. ~> strappa]]
  [[Porti il libretto al dottor Lukács. ~> lukacs]]
  [[Lo rimetti a posto, e non ne parli con nessuno. ~> taci]]
  fragment strappa:
    set margini = true
    set fede = $fede - 1
    > Aspetti che la bibliotecaria si volti, e la pagina si stacca con un rumore che ti sembra fortissimo. A casa la bruci nella stufa. La carta si accartoccia, annerisce, e per un attimo, prima di diventare cenere, i tre nomi brillano rossi, uno sotto l'altro.

    > Il fondatore della tua famiglia, dunque, non fu un corrispondente del Circolo. Lo fondò. E i colpi della prima notte, forse, non erano una sorpresa per nessuno, tranne che per i suoi figli.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Insanity_Icon}.
  fragment lukacs:
    set margini = true
    set trucchi = $trucchi + 1
    > Il dottor Lukács legge i margini due volte, con la lente, poi si toglie gli occhiali e si stropiccia gli occhi. "Tre amici", dice, "un medico, un'attrice e un uomo d'affari, che nel 1828 si inventano una società per parlare con i morti. È la prova che cercavo da quarant'anni." Poi rimette gli occhiali. "O la prova che qualcuno, nel 1828, sapeva già che cosa sarebbe successo."
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge).
  fragment taci:
    set velo = $velo + 1
    > Rimetti il libretto nella sua scatola e lo restituisci alla bibliotecaria con un sorriso. Non ne parli a nessuno: né alla famiglia, né al dottor Lukács, né al Circolo. Ma la notte, alla tenuta, ti sorprendi a bussare piano sulla parete della tua camera, una volta, come si chiede permesso; e dall'altra parte qualcuno risponde, con una pazienza che sembra soddisfatta.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge).

:: G3Cilindro
  set evCilindro = true
  # **Il cilindro di cera**
  > Nella sede del Laborer's Union, un elettricista giovane e magro ti avvicina con l'aria di chi vende qualcosa di rubato. Ha lavorato all'impianto elettrico del Tempio del Circolo, dice, e durante una seduta ha nascosto un fonografo dietro un tendaggio, per scommessa con i compagni. Il cilindro di cera è in una scatola da cappelli, avvolto nell'ovatta.

  > "Ci sono le voci", sussurra. "Quelle dei morti. Non l'ho più voluto ascoltare. Nemmeno i compagni." Vuole sbarazzarsene, e vuole che sia la famiglia della tenuta a prenderlo: voi, dice, sapete che cosa farne.
  ! Che cosa fai?
  [[Lo ascolti, da solo, di notte. ~> ascolta]]
  [[Lo porti al dottor Lukács. ~> lukacs]]
  [[Lo rompi senza ascoltarlo. ~> rompi]]
  fragment ascolta:
    set velo = $velo + 1
    > La puntina gratta, fruscia, e poi si sentono delle voci in una sala, colpi di tosse, un tavolino che scricchiola. Poi una voce più vicina delle altre, roca, come registrata attraverso un tubo d'ottone. Dice il nome della tua famiglia, e poi il tuo, chiaramente, due volte. Sull'etichetta del cilindro c'è una data: due anni prima che tu arrivassi in città.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment lukacs:
    set trucchi = $trucchi + 1
    set velo = $velo - 1
    > Il dottor Lukács ascolta il cilindro tre volte, l'ultima rallentando il fonografo con il dito. Alla velocità giusta, la voce del "morto" è quella del signor Garai, con un garofano in bocca, si direbbe, e un tubo d'ottone davanti alle labbra. Il dottore annota tutto, e ti ringrazia. Poi aggiunge, più piano, che c'è un'altra voce, in fondo alla registrazione, che non riesce a riconoscere, e che non ha voluto rallentare.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Chimica (Chemistry Knowledge).
  fragment rompi:
    > Il cilindro si spezza in tre pezzi sul selciato, come un biscotto. L'elettricista ti guarda con un sollievo enorme, ti ringrazia due volte e se ne va quasi correndo. La sera, al caffè della piazza, il fonografo suona da solo, per un minuto, una canzone che nessuno ha messo.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G3Censimento
  set evCensimento = true
  # **Il censimento**
  > È l'anno del censimento, e al Town Hall l'impiegato addetto alla zona della collina, un giovane con gli occhiali e le dita sporche d'inchiostro, ti ferma nel corridoio con il modulo della tenuta in mano. Ha un problema, dice, e non sa come scriverlo.

  > La sera della sua visita, quando è passato a contare gli abitanti, ha visto la famiglia a tavola, nella sala da pranzo, attraverso la finestra. Ha contato una persona per sedia, come si fa. Le sedie erano undici. Sul modulo, però, la famiglia ha dichiarato soltanto i vivi; e lui vorrebbe sapere chi fossero gli altri, per completezza.
  ! Che cosa fai?
  [[Firmi il modulo con il numero dell'impiegato: undici. ~> undici]]
  [[Fai correggere il numero: soltanto i vivi. ~> vivi]]
  [[Gli chiedi di descriverti gli altri. ~> descrivi]]
  fragment undici:
    set velo = $velo + 1
    > Firmi. Il modulo va a Budapest con gli altri, e la tenuta, nelle statistiche del Regno, risulta la casa più popolosa della provincia. Qualche mese dopo arriva una lettera dell'ufficio centrale, che chiede di precisare l'età di "sette residenti non registrati all'anagrafe". Nessuno risponde. La lettera, sul tavolo dell'ingresso, ingiallisce in una notte.
    block setupEvent next=$hub:
      ! Guadagni 2VP e 1 {icon:Creepy_Icon}.
  fragment vivi:
    set velo = $velo - 1
    > L'impiegato corregge il numero con un sospiro di sollievo. Ti ringrazia: gli sembrava di impazzire. Uscendo dal municipio ti volti verso la collina, e per un momento ti sembra di vedere, alle finestre della sala da pranzo, delle figure che si allontanano, offese, come ospiti a cui è stato detto che la cena è finita.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment descrivi:
    > L'impiegato descrive con precisione da contabile: un signore anziano a capotavola, con un quaderno; una signora con uno scialle nero; due persone che somigliano molto a chi ti ha messo al mondo; una coppia di vecchi che si tenevano per mano; e un bambino con i vestiti bagnati, che giocava con le briciole. "Mangiavano tutti", dice. "Questo mi ha colpito. Nessuno toccava il piatto, ma mangiavano tutti."
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge).

:: G3Facciate
  # **Negozi nuovi**
  ! **Gazzetta di {$townname} – *1901.***
  > **NEGOZI NUOVI, CLIENTI POCHI.** Nell'ultimo mese a {$townname} hanno aperto, una dopo l'altra, alcune botteghe nuove, tutte con le insegne fresche di vernice e le vetrine impeccabili. Le ha pagate in contanti, a quanto risulta al catasto, una società di Budapest di cui nessuno conosce i soci. Nessuna sembra avere molti clienti; tutte restano aperte fino a tardi.

  > Il dottor Lukács, interpellato da questo giornale, non ha dubbi: sono facciate del Circolo dell'Ultima Ora, dietro le quali la società spiritista continua le sue attività lontano da occhi indiscreti. Il Circolo, interpellato a sua volta, ha risposto con un biglietto listato a lutto: "Anche il commercio è una forma di consolazione."
  if $margini:
    > Negli ambienti della Public Library si parla di un libretto francese del 1827, appartenuto a una famiglia notabile, le cui ultime pagine avrebbero un certo interesse per la storia del Circolo. La bibliotecaria si rifiuta di commentare.
  if $evConto:
    > Alla National Bank, intanto, il conto più antico della città ha registrato nell'ultimo mese movimenti insoliti. Il direttore ricorda ai lettori che il segreto bancario è sacro, come quello della confessione.
  if $evCilindro:
    > Circola infine la voce di una registrazione fonografica fatta di nascosto durante una seduta del Circolo. Chi dice di averla sentita giura che una delle voci pronunci il nome di una persona viva.

  ! E la tua famiglia?
  [[Entra a comprare qualcosa in uno dei negozi nuovi. ~> entra]]
  [[Scrive alla Gazzetta per sostenere il dottor Lukács. ~> scrivi]]
  fragment entra:
    set velo = $velo + 1
    > Il negozio vende guanti. La commessa è gentilissima, pallida, e non ha fretta. Mentre provi un paio di guanti grigi, dal retrobottega arrivano tre colpi, uno, due, uno; la commessa sorride e dice che è il gatto. Esci con i guanti nuovi. Sono freddi, e lo restano per tutto l'inverno.
    [[Clicca per continuare... ~> 0]]
  fragment scrivi:
    set fede = $fede - 1
    > La lettera esce il martedì, in terza pagina, firmata con il nome della famiglia per intero. Il dottor Lukács la ritaglia e la appende nel suo studio. Il Circolo non risponde. Ma il mercoledì, davanti a ogni negozio nuovo, c'è un vaso di garofani neri, freschi, uno per vetrina.
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
  if !$evConfessione:
    block hubTitle:
      ! {icon:Storybook} **Il vecchio fabbro – Hospital**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo allo Hospital [[clicca qui. -> G3Confessione]]
  if !$evFosforo:
    block hubTitle:
      ! {icon:Storybook} **Il registro dei veleni – Chemist**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Chemist [[clicca qui. -> G3Fosforo]]
  if !$evCorrente:
    block hubTitle:
      ! {icon:Storybook} **La centrale – Factory**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Factory [[clicca qui. -> G3Corrente]]
  if !$evOfferta:
    block hubTitle:
      ! {icon:Storybook} **L'offerta del Circolo – National Bank**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla National Bank [[clicca qui. -> G3Offerta]]
  if !$evStanze:
    block hubTitle:
      ! {icon:Storybook} **Le stanze nascoste – Builder's Office**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Builder's Office [[clicca qui. -> G3Stanze]]
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

:: G3Confessione
  set evConfessione = true
  # **Il vecchio fabbro**
  > Nella corsia comune dello Hospital, tra un tisico e un uomo con le gambe ingessate, c'è un vecchio con i polmoni bruciati da cinquant'anni di forgia. Respira con un fischio, e ogni respiro gli costa. È Jóska, il fabbro. Ha chiesto alle suore di mandare a chiamare qualcuno della tenuta, e le suore, scandalizzate, hanno obbedito.

  if $joska == "amico":
    > "La famiglia della moneta", dice quando ti vede, e sorride con le gengive. "Volevo che lo sapeste voi, prima del prete."
  elif $joska == "offeso":
    > "Proprio voi", dice quando ti vede, con una specie di soddisfazione. "Volevo che lo sapeste voi. Così ve lo portate dietro."
  > Per vent'anni, dal 1858 al 1878, Jóska ha bussato nei muri di mezzo paese. Lo pagava il signor Garai, quello del garofano; glielo aveva insegnato Madame. Intercapedini, martelletti imbottiti, corde che scendevano in cantina. Le vedove piangevano dall'altra parte del muro, e lui, in cantina, piangeva con loro, per non sbagliare il ritmo.

  > "Ma alla tenuta, mai", dice, e si aggrappa alla tua manica. "E la prima notte, quella del '48, avevo sei anni. Bussavano dalla casa grande, e io rispondevo. Ero io quello che rispondeva. Non quello che bussava."
  ! Che cosa fai?
  [[Mandi a chiamare un notaio: la confessione va messa per iscritto. ~> scrivi]]
  [[Gli chiedi chi bussava, allora, alla tenuta. ~> chiedi]]
  [[Gli tieni la mano finché si addormenta. ~> mano]]
  fragment scrivi:
    set confessione = true
    set velo = $velo - 1
    set prove = $prove + 1
    set trucchi = $trucchi + 1
    > Il notaio arriva in un'ora, con l'inchiostro e due testimoni. Jóska detta tutto, con il fiato corto: le date, le case, i compensi, i nomi. Firma con una croce, perché non ha mai imparato a scrivere, e la croce gli viene storta. Il notaio sigilla la confessione e te ne consegna una copia.

    > Il dottor Lukács, quando la legge, non dice niente per un lungo momento. Poi ti stringe la mano, forte, come chi ha finalmente in mano una prova che regge in tribunale.
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment chiedi:
    set velo = $velo + 1
    > Il vecchio ti guarda, poi guarda la parete della corsia, bianca di calce, come se aspettasse una risposta da lì. "Nessuno di vivo", dice. "Lo sapevo anche da bambino. I vivi bussano con le nocche. Quello bussava con qualcos'altro."

    > Muore quella notte, dicono le suore, senza soffrire. La suora di turno racconta di avere sentito, verso le tre, dei colpi lenti e regolari nel muro dietro il suo letto, e di avere avuto l'impressione che il vecchio, prima di spirare, rispondesse.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment mano:
    > Gli tieni la mano. È dura come il cuoio, piena di cicatrici di bruciature, e alla fine si fa leggera. Il vecchio fabbro si addormenta a metà di una frase, con la bocca aperta, e non si sveglia più.

    > Al funerale, il giorno dopo, ci sono soltanto una suora, un garzone e tu. Mentre il becchino cala la bara, da dentro arrivano tre colpi lievi, uno, due, uno: il gioco del bambino. Il becchino si fa il segno della croce e dice che è la terra che si assesta.
    block setupEvent next=$hub:
      ! Guadagni 1 Charity token {icon:S1_HeartToken} e 1 {icon:Creepy_Icon}.

:: G3Fosforo
  set evFosforo = true
  # **Il registro dei veleni**
  > Il Chemist della piazza ha le vetrine piene di boccette colorate, una bilancia d'ottone e un registro dei veleni, come vuole la legge: chi compra arsenico, stricnina o fosforo bianco deve firmare, con il nome e la ragione dell'acquisto. Il farmacista è un uomo pignolo e chiacchierone, e il registro lo tiene come un libro di preghiere.

  > Te lo mostra con orgoglio, sfogliandolo a ritroso. Fosforo bianco, ogni mese, per trent'anni: le pompe funebri del Circolo ("per l'illuminazione delle cappelle"), un fotografo viennese ("per le lastre"), una certa signora Vámos ("per i reumatismi"). E, più spesso di tutti, con una calligrafia che conosci, la tenuta della tua famiglia: "per esperimenti".
  ! Che cosa fai?
  [[Compri il registro. ~> registro]]
  [[Compri anche tu qualcosa, e firmi. ~> compra]]
  [[Strappi le pagine con il nome della tua famiglia. ~> strappa]]
  fragment registro:
    set trucchi = $trucchi + 1
    > Il farmacista non vuole venderlo: è un documento di legge. Poi vede la cifra che gli offri, e scopre che la legge, in fondo, chiede soltanto che il registro esista, non dove. Esci con il registro sotto il braccio, avvolto in carta da pacchi.

    > A casa lo leggi tutto. Il Circolo ha comprato abbastanza fosforo da far brillare ogni fantasma della provincia. La tua famiglia, però, ne ha comprato il doppio.
    block setupEvent next=$hub:
      ! Se puoi, paga $2: guadagni 3VP. Altrimenti guadagni 1VP.
  fragment compra:
    > Il farmacista pesa la polvere con il cucchiaino d'avorio, la incarta, ti fa firmare. Scrivi il tuo nome sotto quello dei tuoi genitori e dei tuoi nonni, nella stessa colonna, alla voce "per esperimenti". Ti sembra, per un attimo, di continuare una lettera cominciata da altri.
    block setupEvent next=$hub:
      ! Guadagni 2 {icon:Chemical_Icon}.
  fragment strappa:
    > Aspetti che il farmacista vada nel retrobottega, e strappi le pagine una per una, piano, lungo la cucitura. Sono undici. Le bruci la sera stessa nella stufa del laboratorio, dove la carta, impregnata di chissà che cosa, brucia con una fiamma verde.

    > Il giorno dopo il farmacista denuncia il furto alla gendarmeria. Le pagine mancanti, dice, erano quelle del Circolo. Non ricorda nient'altro.
    block setupEvent next=$hub:
      ! Guadagni 1VP e 1 {icon:Creepy_Icon}.

:: G3Corrente
  set evCorrente = true
  # **La centrale**
  > La Factory, sulla riva del fiume, non fabbrica niente: è la centrale elettrica di {$townname}, con due turbine grandi come carrozze, un camino di mattoni rossi e un ingegnere giovanissimo, venuto da Budapest, che la ama come si ama una persona. Ti mostra le dinamo, le valvole, i fili che partono verso la città.

  > Sa della vostra macchina: lo sanno tutti. "Un telegrafo che parla con i morti", dice, divertito. "Sarebbe il primo cliente della centrale che non si lamenta delle bollette." Poi, più serio: "Per una macchina così serve una corrente pulita, costante. Posso portarvi un cavo fino alla tenuta. Oppure, se preferite, fino al municipio."
  ! Che cosa fai?
  [[Paghi il cavo fino alla tenuta. ~> tenuta]]
  [[Ti fai mostrare la centrale di notte. ~> notte]]
  [[Rinunci: la tenuta resterà al buio. ~> buio]]
  fragment tenuta:
    > I pali arrivano in una settimana, il cavo in due. La sera in cui accendono la corrente, alla tenuta, ogni lampadina si illumina insieme, e per un attimo la casa sembra un transatlantico nella notte. Poi le luci tremano tutte insieme, tre volte: uno, due, uno. L'ingegnere dice che è normale. Lo dice due volte.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Ingegneristica (Engineering Knowledge) e 1 {icon:Gears_Icon}.
  fragment notte:
    set velo = $velo + 1
    > Di notte la centrale è una cattedrale: le turbine girano nel buio, le lampade di servizio fanno ombre lunghe, e il ronzio delle dinamo entra nei denti. L'ingegnere ti mostra, sul quadro dei contatori, un ago che non dovrebbe muoversi e che invece, ogni notte tra le tre e le quattro, batte avanti e indietro, a scatti, come un dito che cerca una lettera.

    > "Ho cambiato il contatore tre volte", dice. "Ho pensato a un guasto, a un furto di corrente, a un topo. Poi ho cominciato a scriverli, i movimenti." Ti mostra il quaderno. Sono lettere. E le lettere, messe in fila, fanno il nome della tua famiglia.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment buio:
    > Ringrazi l'ingegnere e gli dici che la tenuta ha sempre funzionato a lampade a petrolio, e continuerà così. Lui alza le spalle, deluso come un innamorato respinto. Il cavo, una settimana dopo, lo porta al municipio.

    > La tenuta resta l'unica casa buia della collina. Dalla città, la sera, la gente la guarda e si fa il segno della croce, come si faceva una volta.
    block setupEvent next=$hub:
      ! Guadagni 1VP.

:: G3Offerta
  set evOfferta = true
  # **L'offerta del Circolo**
  > Nell'ufficio del direttore della National Bank, seduto nella poltrona del direttore, c'è un signore alto, magro, elegantissimo, con un garofano nero all'occhiello. Si presenta come il signor Garai, presidente del Circolo dell'Ultima Ora. Non sembra avere più di cinquant'anni. Ha la stessa calligrafia, ti dice divertito, di suo padre e di suo nonno.

  > Conosce i debiti della tua famiglia fino all'ultimo centesimo, e li pagherà tutti, oggi stesso. In cambio chiede una cosa sola: i progetti del Telegrafo dei Morti, le tre tavole a china disegnate dal fondatore. "Erano destinate a noi, in origine", dice. "Il vostro antenato le tenne per sé. Lo abbiamo perdonato. Ma vorremmo riaverle."
  ! Che cosa fai?
  [[Accetti: gli dai i progetti. ~> accetta]]
  [[Rifiuti. ~> rifiuta]]
  [[Gli dai dei progetti falsi, ricopiati con qualche errore. ~> falsi]]
  fragment accetta:
    set fede = $fede + 1
    > Il signor Garai riceve le tavole con un rispetto quasi religioso, le arrotola, le lega con un nastro nero. Il direttore della banca firma la quietanza dei debiti con le mani che tremano. Uscendo, ti accorgi che sul tuo conto c'è anche un piccolo versamento in più, "per gli interessi di settant'anni".
    block setupEvent next=$hub:
      ! Guadagni $4.
  fragment rifiuta:
    set fede = $fede - 1
    > Il signor Garai non insiste. Si alza, si infila i guanti, ti augura buona fortuna con il Telegrafo. "Lo finirete", dice. "È nel sangue. E quando lo accenderete, sarete voi a chiamarci." La porta si chiude da sola alle sue spalle. Il direttore, pallido, ti chiede se vuoi rinegoziare il mutuo.
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment falsi:
    > Passi tre notti a ricopiare le tavole, introducendo errori minuscoli, un avvolgimento invertito, una valvola al posto sbagliato. Il signor Garai le esamina a lungo, con un monocolo, poi le arrotola e paga. Sulla porta si volta. "I morti controlleranno", dice, sorridendo. "Sono pignoli." Quella notte, nel laboratorio, trovi le tue copie sbagliate sulla scrivania, corrette a matita, punto per punto.
    block setupEvent next=$hub:
      ! Guadagni $2 e 1 {icon:Creepy_Icon}.

:: G3Stanze
  set evStanze = true
  # **Le stanze nascoste**
  > Al Builder's Office il vecchio capomastro, che ha costruito i negozi nuovi della piazza per conto di "una società di Budapest", ti chiama nel suo ufficio e chiude la porta. Ha costruito molte cose strane, dice, in quarant'anni di mestiere; ma mai così tante tutte insieme.

  > Ti mostra le piante. Ogni negozio ha una stanza in più, dietro il retrobottega, senza finestre, con una porta nascosta nella tappezzeria. E da ogni stanza parte un tubo d'ottone, sotto la strada, fino al Tempio del Circolo. "Per parlarsi", dice. "Come su una nave. Ma chi parla? E con chi?"
  ! Che cosa fai?
  [[Porti le piante al dottor Lukács. ~> lukacs]]
  [[Le porti al Circolo, e chiedi quanto valgono. ~> circolo]]
  [[Entri di notte in una delle stanze nascoste. ~> entra]]
  fragment lukacs:
    set trucchi = $trucchi + 1
    set prove = $prove + 1
    set velo = $velo - 1
    > Il dottor Lukács stende le piante sul tavolo del suo studio, le tiene ferme con quattro libri e le guarda in silenzio, come un generale guarda una mappa. "Le vedove al piano di sopra", dice alla fine, "e i tubi al piano di sotto. Ecco come facevano a sapere tutto." Ti stringe la mano. "Questo regge in tribunale."
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment circolo:
    set fede = $fede + 1
    > Il signor Garai ti riceve nel suo studio, guarda le piante senza toccarle e sorride. "Valgono quanto il vostro silenzio", dice, e scrive una cifra su un biglietto. È una cifra generosa. Le piante finiscono nella stufa del Circolo, davanti a te. Il capomastro, il mese dopo, va in pensione, con una casa nuova in riva al lago.
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment entra:
    set velo = $velo + 1
    > La porta nella tappezzeria del negozio di guanti si apre con una spinta. La stanza nascosta è piccola, buia, con una sedia, un tavolino e l'imboccatura di un tubo d'ottone. Ti siedi. Avvicini l'orecchio. Dal tubo arriva un brusio, molte voci insieme, come in un salotto pieno di gente; poi una voce sola, vicinissima, che dice il tuo nome e ti chiede se la stanza è di tuo gradimento.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Creepy_Icon}.

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
  if $confessione:
    > Tra i documenti che passano di mano in mano in città c'è una copia della confessione del vecchio fabbro Jóska, firmata con una croce storta e controfirmata da un notaio: vent'anni di colpi nei muri, pagati a giornata. Chi la legge fino in fondo si ferma sempre sull'ultima riga, quella sulla prima notte, e la rilegge.
  if $evFosforo:
    > Il farmacista della piazza, intanto, racconta a tutti i clienti che il suo registro dei veleni è diventato, all'improvviso, il libro più interessante della città.
  if $evCorrente:
    > E l'ingegnere della centrale, al caffè, mostra a chi glielo chiede un quaderno pieno di lettere scritte da un ago che non dovrebbe muoversi.

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
  if !$evTomba:
    block hubTitle:
      ! {icon:Storybook} **La prima tomba – Cemetery**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Cemetery [[clicca qui. -> G3Tomba]]
  if !$evInviti:
    block hubTitle:
      ! {icon:Storybook} **Gli inviti – Town Hall**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo al Town Hall [[clicca qui. -> G3Inviti]]
  if !$evCampane:
    block hubTitle:
      ! {icon:Storybook} **Le campane d'argento – Foundry**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Foundry [[clicca qui. -> G3Campane]]
  if !$evVigilia:
    block hubTitle:
      ! {icon:Storybook} **La vigilia – Church**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Church [[clicca qui. -> G3Vigilia]]
  if !$evVisitatori:
    block hubTitle:
      ! {icon:Storybook} **Il libro dei visitatori – Library**
    block hubDetails:
      ! Il primo giocatore che manda un suo pezzo alla Library [[clicca qui. -> G3Visitatori]]
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

:: G3Tomba
  set evTomba = true
  # **La prima tomba**
  > Il becchino, adesso, è il figlio del vecchio becchino Mihály: un uomo di cinquant'anni, grande e taciturno come il padre, con lo stesso berretto. Ti accompagna alla tomba del fondatore, la prima della famiglia, quella da cui tutto è cominciato cinquantasette anni fa.

  if $tubo == "ascoltato":
    > Il tubo d'ottone è ancora aperto, e intorno al tumulo c'è un mucchio di biglietti piegati, alcuni recenti, alcuni gialli e sbriciolati: la posta dei vivi per i morti, che nessuno ha mai smesso di imbucare.
  elif $tubo == "sigillato":
    > Il tappo di piombo che chiudeva il tubo è sull'erba, accanto alla lapide, liscio e lucido come una moneta. Nessuno l'ha toccato: è uscito da solo, dice il becchino, una notte d'estate, con un rumore di tappo di champagne.
  elif $tubo == "lasciato":
    > Sul tubo d'ottone qualcuno ha montato un campanello nuovo, d'argento, uguale a quelli delle pompe funebri del Circolo. "L'idea gliel'ha data lui", dice il becchino, indicando la lapide. "Il primo. Gli altri l'hanno copiata."
  else:
    > La lapide è consumata dalla pioggia, e il nome si legge appena. Accanto, nell'erba, c'è ancora il buco del vecchio tubo d'ottone, riempito di terra.
  > Il Circolo ha chiesto di trasferire le spoglie del fondatore nel suo Tempio, in una cripta di marmo nero. La parrocchia si oppone. Il becchino aspetta che la famiglia decida.
  ! Che cosa fai?
  [[Fai aprire la tomba, prima di decidere. ~> apri]]
  [[Lasci che il Circolo lo porti nel Tempio. ~> tempio]]
  [[Resta dov'è, in terra consacrata. ~> resta]]
  fragment apri:
    set velo = $velo + 1
    > Il becchino scava per tutto il pomeriggio. Quando la vanga tocca il legno, si ferma e si toglie il berretto. Il coperchio si solleva senza fatica, perché i chiodi non ci sono più.

    > Dentro, il fondatore della vostra famiglia è intatto, come il bambino dello stagno nei racconti di famiglia: le guance appena rosate, le labbra socchiuse. La cordicella del campanello è stretta nella mano destra. Nella sinistra c'è una matita, consumata fino al legno. E il fondo della bara, sotto di lui, è coperto di scritte fittissime, che nessuno riesce a leggere prima che il becchino, tremando, richiuda.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge), 1 {icon:Insanity_Icon} e 1 {icon:Creepy_Icon}.
  fragment tempio:
    set fede = $fede + 1
    > La traslazione si fa di notte, con le torce, la banda del Circolo e duecento persone in nero. La bara, dicono i portatori, pesa la metà di quanto dovrebbe. Nel Tempio la sistemano nella cripta, sotto una lastra di marmo nero con un occhio d'argento, e da quel giorno le sedute del giovedì si tengono lì sopra.
    block setupEvent next=$hub:
      ! Guadagni $3.
  fragment resta:
    set velo = $velo - 1
    set fede = $fede - 1
    > Rispondi al Circolo che il fondatore resta dove l'hanno messo, e Padre Benedek benedice di nuovo la tomba, con un'acqua santa che sfrigola un poco sull'ottone. Il Circolo non replica. Ma la mattina dopo, sulla lapide, c'è un garofano nero; e accanto, nell'erba, impronte di scarpe da donna, piccole, che arrivano fino alla tomba e non ripartono.
    block setupEvent next=$hub:
      ! Guadagni 2VP.

:: G3Inviti
  set evInviti = true
  # **Gli inviti**
  > Il Sindaco Bódi, nipote del vecchio Bódi, è un giovanotto elegante con la scriminatura al centro e un'agenda di pelle. È lui a organizzare la Grande Seduta dell'ultima notte dell'anno nella sala grande del municipio: duecento sedie in cerchi concentrici, le lampade elettriche spente, un tavolo al centro. "Una serata storica", dice. "Il giornale di Budapest manderà un fotografo."

  if $bodi == "comprato":
    > "Mio nonno diceva che con la vostra famiglia si fanno buoni affari", aggiunge. "Mio padre lo confermava."
  elif $bodi == "ricattato":
    > "Mio nonno mi ha lasciato una lettera su di voi", aggiunge, senza smettere di sorridere. "Parla di una ricevuta. Nella mia famiglia abbiamo buona memoria."
  elif $bodi == "chiesa":
    > "Mio nonno stava con il parroco", aggiunge, "e anche voi, a quanto pare. Ma i tempi cambiano, e il municipio è di tutti."
  > Sul tavolo c'è la pianta della sala, con i nomi scritti a matita. Al tavolo centrale, per adesso, ci sono soltanto la vostra famiglia e il Circolo. Il resto si può ancora cancellare.
  ! Che cosa fai?
  [[Fai sedere al tavolo centrale anche il dottor Lukács e Padre Benedek. ~> testimoni]]
  [[Lasci che sia il Circolo a decidere i posti. ~> circolo]]
  [[Paghi perché il tavolo centrale sia soltanto della famiglia. ~> famiglia]]
  fragment testimoni:
    set fede = $fede - 1
    > Il Sindaco cancella e riscrive, con una smorfia. Il dottor Lukács accetta con un biglietto di tre righe: porterà il taccuino e una lampada tascabile. Padre Benedek accetta con una riga sola: porterà l'acqua santa. Il Circolo non risponde, e questo è già una risposta.
    block setupEvent next=$hub:
      ! Guadagni 1VP e arretra di 1 casella sul tracciato {icon:Insanity_Icon}.
  fragment circolo:
    set fede = $fede + 1
    > Il Sindaco consegna la pianta della sala a un signore alto con un garofano nero all'occhiello, che aspettava nell'anticamera. Il signore la studia con calma, sposta tre nomi, ne aggiunge uno, ringrazia. Uscendo, ti stringe la mano. È fredda; e ha, ti sembra, la stessa età del ritratto che sta nel salotto del Circolo, dipinto nel 1828.
    block setupEvent next=$hub:
      ! Guadagni $2.
  fragment famiglia:
    > Il Sindaco intasca la busta con la naturalezza di famiglia e cancella, con la gomma, tutti gli altri nomi dal tavolo centrale. "Una serata storica", ripete, "merita una famiglia storica."
    block setupEvent next=$hub:
      ! Se puoi, paga $3: guadagni 4VP. Altrimenti non succede niente.

:: G3Campane
  set evCampane = true
  include CasoGiocatore
  # **Le campane d'argento**
  > Nella Foundry si fondono le campanelle d'argento per le tombe del Circolo, quelle legate al polso dei morti con un filo. Il capo fonditore, un uomo coperto di cicatrici, ti mostra con imbarazzo l'ultimo ordine: una campanella per ogni membro della tua famiglia, dal fondatore in poi, ciascuna con il nome inciso e le date.

  > Le campanelle dei morti sono pronte, in fila sul bancone, con le due date. Quelle dei vivi hanno soltanto la data di nascita. Tutte tranne una: quella con il nome di **{$caso}**, che ha già anche la seconda data. *31 dicembre 1905.*
  ! Che cosa fai?
  [[Fai fondere tutte le campane. ~> fondi]]
  [[Compri la campana con quel nome. ~> compra]]
  [[Lasci stare: è una provocazione del Circolo. ~> lascia]]
  fragment fondi:
    set velo = $velo - 1
    set fede = $fede - 1
    > Paghi il doppio dell'ordine, e il capo fonditore getta le campanelle nel crogiolo una alla volta. L'argento fonde in fretta, con un sibilo. L'ultima a finire nel fuoco è quella con la data, e suona, una volta sola, prima di sciogliersi. Il fonditore dice che è l'aria nel metallo. Non ti guarda negli occhi.
    block setupEvent next=$hub:
      ! Guadagni 2VP.
  fragment compra:
    set velo = $velo + 1
    > Compri la campanella e la porti a casa nel taschino, avvolta in un fazzoletto. **{$caso}** la rigira tra le dita, poi la mette sul comodino, "per abituarsi". Di notte, a volte, la campanella suona da sola, piano. Non c'è mai vento.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Creepy_Icon}.
  fragment lascia:
    > Esci dalla Foundry senza voltarti. Il capo fonditore consegna le campane al Circolo, come da contratto, e il Circolo le appende in fila nel suo Tempio, sotto il ritratto del fondatore. Le campane dei morti tacciono. Quella con la data, dicono le vedove del giovedì, suona ogni sera a mezzanotte, e ogni sera un po' più forte.
    block setupEvent next=$hub:
      ! Guadagni 1 {icon:Creepy_Icon} e $2.

:: G3Vigilia
  set evVigilia = true
  # **La vigilia**
  > La chiesa è fredda e quasi vuota, con l'odore della cera e dei fiori del giorno prima. Padre Benedek sta spegnendo le candele davanti all'altare con un lungo spegnitoio d'ottone. Ti vede, finisce il suo lavoro con calma e viene a sederti accanto, nel banco, come un vecchio conoscente.
  if $benedek == "amico":
    > "Domani sera", dice, "la vostra famiglia siederà in mezzo alla sala. Non vi chiedo di non andare. Vi chiedo di andarci in pace. Ve lo devo, da quando avevo dodici anni."
  elif $benedek == "deluso":
    > "Domani sera", dice, "la vostra famiglia siederà in mezzo alla sala. Non mi illudo di convincervi a restare a casa. Ma il mio mestiere è offrire, non convincere."
  else:
    > "Domani sera", dice, "la vostra famiglia siederà in mezzo alla sala. Volevo vedervi prima. Per conoscervi, almeno."
  > Ti offre quello che un prete può offrire: una confessione, una benedizione, un po' d'acqua santa in una boccetta da farmacia, come quella che Padre Anzelm portava con sé cinquant'anni prima.
  ! Che cosa fai?
  [[Ti confessi. ~> confessa]]
  [[Gli chiedi di venire alla Grande Seduta, con l'acqua santa. ~> invita]]
  [[Rifiuti tutto, con gentilezza. ~> rifiuta]]
  fragment confessa:
    set fede = $fede - 1
    set velo = $velo - 1
    > Ti inginocchi nel confessionale e parli a lungo: dei colpi, delle voci, del diario, di tutto quello che la tua famiglia ha fatto per tre generazioni. Padre Benedek ascolta senza interromperti. Alla fine non ti dà penitenze: ti dice soltanto di dormire, stanotte, con la luce accesa. Lo fai, e dormi benissimo.
    block setupEvent next=$hub:
      ! Arretra di 1 casella sul tracciato {icon:Insanity_Icon} e di 1 sul tracciato {icon:Creepy_Icon}.
  fragment invita:
    set fede = $fede - 1
    > Padre Benedek ci pensa a lungo, guardando l'altare. Poi annuisce. "Verrò", dice. "Mi siederò in fondo, accanto alla porta, con la stola in tasca. Se qualcosa dovesse andare storto, voglio che ci sia qualcuno a ricordare che i vivi hanno anche un altro posto dove andare."
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment rifiuta:
    set fede = $fede + 1
    set velo = $velo + 1
    > Gli dici di no, con gentilezza: la tua famiglia ha cominciato questa storia senza l'aiuto della Chiesa, e la finirà allo stesso modo. Il prete non insiste. Ti accompagna alla porta e, sulla soglia, ti traccia sulla fronte un piccolo segno di croce con il pollice, senza chiedere il permesso. Per tutta la notte la fronte ti brucia, appena, come dopo una giornata di sole.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge).

:: G3Visitatori
  set evVisitatori = true
  # **Il libro dei visitatori**
  > Nella Library, sul leggio accanto all'ingresso, c'è il libro dei visitatori: un registro enorme, rilegato in pelle verde, dove ogni lettore firma il giorno della sua visita. La bibliotecaria, una signorina severa con il pince-nez, te lo mostra perché, dice, c'è una cosa che vorrebbe spiegata.

  > Sfoglia all'indietro. Ogni mese, dal 1850, c'è la stessa firma, sottile ed elegante: *E. Vámos*. Sempre la stessa mano, sempre lo stesso inchiostro, cinquantacinque anni di prima domenica del mese. L'ultima firma è sull'ultima riga scritta. Ha la data di domani.
  ! Che cosa fai?
  [[Strappi la pagina. ~> strappa]]
  [[Firmi anche tu, sotto. ~> firma]]
  [[Chiedi alla bibliotecaria di sorvegliare il libro, domani. ~> sorveglia]]
  fragment strappa:
    set velo = $velo - 1
    > La pagina si strappa con un rumore secco che rimbomba nella sala di lettura. La bibliotecaria trattiene il fiato, poi annuisce, come chi approva un'operazione chirurgica. Il giorno dopo, sulla nuova pagina bianca, c'è già la stessa firma, con la data del giorno dopo ancora.
    block setupEvent next=$hub:
      ! Guadagni 1VP.
  fragment firma:
    set velo = $velo + 1
    > Firmi sotto, con la tua calligrafia, la data di oggi. La penna gratta. Quando rialzi gli occhi, sotto la tua firma ce n'è un'altra, fresca, che prima non c'era: una calligrafia che conosci dal diario, inclinata all'indietro. La data è la stessa della firma di E. Vámos.
    block setupEvent next=$hub:
      ! Guadagni 1 Conoscenza Occulta (Occult Knowledge) e 1 {icon:Insanity_Icon}.
  fragment sorveglia:
    > La bibliotecaria sorveglia il libro per tutta la domenica, seduta accanto al leggio con le braccia incrociate. Nessuno firma. Alla chiusura, però, quando abbassa gli occhi, la firma c'è: è comparsa mentre guardava, dice, o forse mentre sbatteva le palpebre. Da quel giorno la bibliotecaria saluta la famiglia con molto rispetto, e un po' di paura.
    block setupEvent next=$hub:
      ! Guadagni 2VP.

:: G3GrandeSeduta
  # **La Grande Seduta**
  ! **Ultimo verbale di seduta – {$townname}, *31 dicembre 1905.***
  > L'ultima notte del 1905 {$townname} si riunisce nella sala grande del municipio: il sindaco, il consiglio, il Circolo, la parrocchia, il dottor Lukács con il suo taccuino e, al centro, la famiglia della tenuta. Duecento persone sedute in cerchi concentrici, le mani intrecciate a quelle dei vicini, le lampade spente. Nessuno ricorda chi l'abbia convocata. Tutti, però, sono venuti.

  > A mezzanotte meno un quarto i colpi cominciano. Non alle pareti: dappertutto. Nel pavimento, nel soffitto, nelle sedie, nel petto di ciascuno. Cinquantasette anni dopo quella prima notte, il velo non è mai stato così sottile.

  if $evInviti:
    > Al tavolo centrale siedono la famiglia, il Circolo e, secondo gli accordi presi con il Sindaco, chi doveva sedersi lì. Il dottor Lukács ha il taccuino aperto sul ginocchio. Padre Benedek tiene una mano in tasca, sulla stola, e non perde di vista nessuno.
  if $evCampane:
    > Da qualche parte, fuori dalla sala, nel cimitero, una delle campanelle d'argento delle tombe suona da sola, una volta, come per dare l'inizio.
  if $evTomba:
    > Più tardi, chi era presente giurerà che al momento dei primi colpi una sedia vuota, al tavolo centrale, era già stata spostata, appena un poco, come da qualcuno arrivato in ritardo dal cimitero.

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
