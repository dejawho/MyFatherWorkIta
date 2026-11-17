// I finali. Ognuno chiude con la rivelazione sul notaio Ezra Pell (ultimo colpo di scena),
// poi con l'epilogo comune: che ne fu degli altri.

:: Epilogo
  ! **Che ne fu degli altri.**
  if $ada > 0 || $haskett > 0:
    > Ada Haskett visse altri vent'anni, nella casetta della zia vicino alla stazione, con il gatto e il taccuino nero. Ogni Natale riceveva dalla tenuta una cassetta di mele e un biglietto, e ogni Natale rispondeva con due righe: *Ancora niente. Vi tengo d'occhio.*
  else:
    > Ada Haskett lasciò la città l'anno dopo, senza salutare nessuno, e andò a vivere in una città di mare, dove nessuno aveva mai sentito parlare di Umber. Dicono che lì fosse felice. Dicono anche che, la notte, controllasse due volte la serratura.
  if $casa != "":
    > Lo studio sul vicolo, quello degli specchi, quello che **{$casa}** aveva trovato tanti anni prima seguendo le impronte nel fango, rimase come era. La porta senza maniglia, dal vicolo, non si aprì più. Dall'interno, qualche volta, sì.
  if $internato:
    > Nell'archivio del manicomio sulla collina si conserva ancora la cartella del primo paziente di riguardo del reparto dei signori, un erede della tenuta, con la diagnosi scritta da Lady Carew in persona: *caso interessante*.
  if $arrestato:
    > La cella della Jail con la finestra sul vicolo, quella dove un innocente della famiglia passò tanti anni, è stata chiusa e trasformata in archivio. Le guardie non ci entrano volentieri, di notte. Dicono che dalla finestra si vede passare qualcuno.
  if $umber == "preso":
    > Il processo all'Erede nell'Ombra, l'unica volta che la città riuscì a mettere le mani su Umber, si studia ancora nelle università di diritto, come esempio di colpevole che non ricordava il suo crimine. I professori non sono d'accordo su niente. Gli studenti si divertono moltissimo.
  if $lapide == "torna presto":
    > Sulla tomba del vecchio, sotto il nome, le due parole fatte incidere dalla famiglia si leggono ancora: *Torna presto*. Qualcuno le ripassa con lo scalpello ogni pochi anni, perché il muschio non le copra.
  elif $lapide == "senza nome":
    > La tomba del vecchio, senza nome, è la più visitata del cimitero. Ci portano i bambini, per spaventarli. Ci portano i fiori, per scaramanzia. Le violette, ogni mattina, ci sono sempre.
  if $evBecchino:
    > Il notaio Ezra Pell è sepolto nel cimitero nuovo, vicino al muro di cinta, sotto un tiglio, in una fossa pagata venticinque anni prima con un assegno. Sulla lapide c'è scritto soltanto: *Qui riposa chi ha tenuto la chiave*.
  if $evStatua:
    > La statua di bronzo del vecchio è ancora in piazza, con il diario sotto il braccio. I piccioni la preferiscono a tutte le altre. Gli innamorati si danno appuntamento sotto di lei, di sera, e nessuno sa spiegare perché, a una certa ora, l'ombra della statua sia molto più corta della statua.
  if $cappotto == "teatro":
    > Il cappotto nero del vecchio è finito, dopo lo scioglimento della compagnia, nel magazzino di un rigattiere. Ogni tanto qualcuno lo compra. Ogni volta, dopo qualche settimana, il rigattiere lo ritrova appeso alla sua porta, piegato con cura.
  > Il fascicolo Pell, o quello che ne resta, è quello che avete appena finito di leggere. Se lo avete letto in ordine, senza saltare niente, sapete già chi lo ha chiuso. Se vi sembra di riconoscere la grafia delle ultime pagine, non fermatevi a pensarci. Chiudetelo, e andate a dormire. Con la luce accesa, magari.


:: FinaleForca [ending]
  # **La Forca**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} – *1913.***
  > A chi aprirà il fascicolo, dopo di me.

  > La città aveva già preso Umber una volta, e le era piaciuto. Quando gli avvistamenti ricominciarono, nessuno ebbe voglia di aspettare un'altra perizia. Una notte di marzo vennero alla tenuta con le torce, e se ne andarono con uno di noi: quello che scriveva più in fretta, e la cui mano, scrivendo in fretta, pendeva all'indietro. Il processo durò un pomeriggio. La forca la montarono in piazza, davanti alla Jail, dove una volta c'era il mercato.

  > Non era lui. Lo so perché la notte dopo l'impiccagione, in fondo al cimitero, accanto al cancello, qualcuno rise per un'ora intera. Lo sentirono tutti, e nessuno uscì a vedere.

  > Il notaio Ezra Pell assistette all'esecuzione in prima fila, con il cappello in mano, e morì un mese dopo. Quando aprimmo il suo fascicolo, le ultime pagine erano scritte in una grafia minuta, svelta, inclinata all'indietro. L'ultima riga diceva soltanto: *Mi dispiace. Non era lui. Ero io.*

  > La forca l'hanno smontata il giorno dopo, e il legno è stato venduto all'asta: lo ha comprato, per pochi soldi, il teatro della carovana, che ci ha costruito un palco nuovo. Da allora, ogni volta che vado a teatro, mi siedo in ultima fila, vicino alla porta.
  if $notte == "ada":
    > Ada Haskett, che quella notte era con noi nello studio, si è rifiutata di testimoniare al processo. Ha restituito il taccuino nero della zia alla polizia, con una lettera di due righe, e ha lasciato la città.
  if $stampa == "venduta":
    > I due giornali hanno pubblicato la nostra storia per intero, il giorno dell'impiccagione, con lo stesso titolo di un anno prima. Questa volta, sotto, c'era una fotografia.
  include Epilogo
  ! FINE?

:: FinaleSpecchio [ending]
  # **Lo Specchio Rotto**
  ui generationEndingContinue enabled=true
  ! **Ultima pagina del diario.**
  > Scrivo con l'altra mano, perché questa è la mia, adesso. L'erede che la usava prima di me ha bevuto il sale nuovo, una sera, per vedere se poteva tornare indietro. Non poteva. Era già mezzo dall'altra parte da quando era nato, e il sale nuovo ha solo chiuso la porta.

  > Non lo rimpiango. Era una persona noiosa: dormiva la notte, pagava i debiti, chiedeva scusa. Io no. Io ho rotto tutti gli specchi dello studio, perché nessuno dei due avesse più bisogno di guardarsi, e da allora sto benissimo.

  > Una cosa sola, prima di chiudere questo quaderno, perché la famiglia non dica che Umber non paga i suoi debiti. Gli assegni degli ultimi vent'anni non li ho firmati tutti io. La notte del temporale, nello studio, c'era un altro di noi: in piedi accanto al camino, con il cappotto bagnato e il testamento in mano. L'ho visto negli specchi, prima di romperli. Rideva con la mia stessa bocca.

  > Chiedete al notaio che cosa c'era nella credenza di suo padre. Chiedeteglielo presto: non gli resta molto.

  > La famiglia mi tratta con gentilezza, come si tratta un parente malato. Mi lasciano il laboratorio, la notte, e la porta sul vicolo. Al mattino trovano i bicchieri lavati e il diario aggiornato, con una grafia che pende all'indietro e che, devo dirlo, è molto più leggibile della vostra.
  if $cappotto == "appeso":
    > Il cappotto nero, all'ingresso, adesso è mio. Mi sta a pennello.
  elif $cappotto == "bruciato":
    > Avete bruciato il mio cappotto. Non importa: ne ho comprato un altro, uguale, con il vostro denaro.
  include Epilogo
  ! FINE?

:: FinaleCitta [ending]
  # **La Città delle Ombre**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} – *1913.***
  > A chi aprirà il fascicolo, dopo di me.

  > Il sale nuovo di Lomax non si è più fermato. Lo comprano gli studenti per scommessa, le signore per noia, i banchieri per coraggio. Lomax ne vendeva più di quanto riuscisse a prepararne, e dopo la sua morte la ricetta l'ha comprata l'Istituto di scienze, che lo vende con un'etichetta più elegante e un prezzo più alto.

  > La nostra famiglia, in tutto questo, non conta più niente. Siamo i parenti del vecchio, quelli che hanno cominciato, e la gente ci saluta per strada con un rispetto distratto, come si salutano i discendenti di un inventore. Qualcuno di noi, la sera, esce con gli altri. Nessuno chiede chi.
  if $istituto:
    > Sull'etichetta c'è il nome del vecchio, in caratteri dorati. L'Istituto ha usato bene gli appunti che gli avevamo venduto noi.

  > Chi lo beve non torna indietro, ma nessuno sembra soffrirne. Di giorno {$townname} è una città come le altre, operosa e rispettabile. Di notte metà dei suoi abitanti esce di casa con un altro volto, più piccolo, più svelto, e si incontra nei vicoli a ridere. La polizia ha smesso di contare gli assegni. I giornali hanno smesso di scrivere di Umber: ce ne sono troppi.

  > Il notaio Ezra Pell è morto in autunno, nel suo letto. Nel suo testamento ha lasciato tutto all'Istituto, "perché la scienza finisca quello che la mia famiglia ha cominciato". La firma è autentica: l'hanno controllata tre periti. Pende all'indietro.
  include Epilogo
  ! FINE?

:: FinaleRitorno [ending]
  # **Il Ritorno del Padre**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$dose} – *1913.***
  > Vi scrivo con la mano di {$dose}, perché è l'unica che ho. Il sale di Lomax era l'ultimo, ed era buono: quando {$dose} l'ha bevuto, la sera del temporale, la porta si è aperta dall'altra parte, e io sono rientrato. Non da Umber: da me stesso. Il vecchio della tenuta, quello che avete seppellito sotto settanta chili di pietre.

  > {$dose} c'è ancora, da qualche parte. Lo sento, la mattina, quando mi allaccio le scarpe; poi passa. Non vi preoccupate: mi prenderò cura della tenuta meglio di quanto abbiate fatto voi. Ho cinquant'anni di lavoro da recuperare, e finalmente un corpo giovane per farlo.

  > Prima di cominciare, una questione d'onore. Il notaio Ezra Pell, il figlio del mio amico, è venuto a trovarmi ieri. Ha trovato tanti anni fa la polvere della credenza di suo padre, e l'ha usata come l'avevo usata io: è lui che ha firmato gli assegni, quando nessuno di voi era me. È stanco, e mi ha chiesto se esiste un modo per tornare indietro. Gli ho detto la verità: non esiste. Poi gli ho offerto un bicchiere.

  > Sono passato dalla piazza, stamattina, a piedi, con le gambe di {$dose}, che sono buone gambe. La città è cambiata. Le case di legno non ci sono più, il fiume è coperto, il mercato è diventato una prigione. Il cimitero, invece, è sempre lo stesso. Mi sono fermato davanti alla mia tomba. Ho lasciato delle violette.
  if $lapide == "torna presto":
    > Avevate fatto incidere sulla mia lapide due parole: *Torna presto*. Vi ho preso in parola. Ci ho messo cinquant'anni, ma sono stato di parola anch'io.
  if $aiutiEzra > 0:
    > Ringrazio anche chi, in famiglia, ha portato al notaio quello che chiedeva, senza farsi domande. Una pagina, un pizzico di sale, una chiave, un capello: senza di voi non avrebbe trovato la strada fin qui. E nemmeno io.
  include Epilogo
  ! FINE?

:: FinaleSalePuro [ending]
  # **Il Sale Puro**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} – *1913.***
  > A chi aprirà il fascicolo, dopo di me.

  > Bevemmo l'antidoto la notte del temporale, tutti insieme, nello studio con due porte. Non successe niente di spettacolare: un po' di nausea, un gran sonno, e al mattino una strana sensazione di silenzio, come quando smette di piovere. Da quella notte nessuno ha più visto Umber.

  > Con lui se n'è andato anche il resto. Le nostre formule non funzionano più, gli esperimenti falliscono, il diario sembra scritto in una lingua che non sappiamo più leggere. Siamo diventati quello che la città ha sempre voluto: una famiglia per bene, con una casa troppo grande e niente da dire. Ci annoiamo moltissimo.

  > La porta sul vicolo l'abbiamo murata la settimana dopo, con mattoni nuovi e calce bianca. Per un mese, la mattina, abbiamo trovato graffi sull'intonaco, dalla parte del vicolo, all'altezza di un uomo piccolo. Poi più niente. Il muratore dice che sono stati i gatti.
  if $madre && $prova == "ragazzo":
    > Una cosa buona, però, l'abbiamo fatta. Il figlio della donna in nero, il primo a cui avevamo dato l'antidoto, è tornato a casa sua da mesi, e la domenica è in chiesa, in prima fila, con sua madre. Quando ci vede, si toglie il cappello.
  elif $madre:
    > Una cosa buona, però, l'abbiamo fatta. Il giorno dopo il temporale abbiamo portato un bicchiere d'antidoto al manicomio, al figlio della donna in nero. Ha smesso di ridere a metà del pomeriggio. La sera è tornato a casa, a piedi, con sua madre, e la domenica dopo erano tutti e due in chiesa, in prima fila.

  > Il notaio Ezra Pell bevve il suo bicchiere per ultimo, quella notte, dopo averlo guardato a lungo. Morì nel sonno tre giorni dopo, sorridendo. Quando aprimmo il suo fascicolo, le ultime pagine erano scritte in due grafie che si alternavano riga per riga, una in avanti e una all'indietro. A metà dell'ultima pagina le due grafie diventavano una sola, e la frase finale era: *Finalmente, uno.*
  if $prova == "tu":
    > Chi di noi aveva assaggiato l'antidoto per primo, nel laboratorio, dice che il silenzio nella testa non è mai più andato via. Dice che all'inizio era una benedizione. Adesso, certe sere, siede alla finestra e aspetta qualcuno che non viene.
  include Epilogo
  ! FINE?

:: FinaleDoppio [ending]
  # **Il Doppio Erede**
  ui generationEndingContinue enabled=true
  ! **Atto del notaio Ezra Pell – *1913.***
  > Il sottoscritto, notaio in {$townname}, dà esecuzione alla clausola del testamento del defunto, letta per la prima volta da suo padre Silas Pell nel marzo 1861. Essendo le circostanze della morte del testatore accertate come dubbie, tutti i beni non assegnati agli eredi, il denaro in banca, le azioni e la chiave dello studio sul vicolo, passano a Mr. Umber.

  > Il beneficiario si è presentato nello studio del sottoscritto di persona e in pieno giorno, come richiesto da suo padre cinquant'anni fa, alle dodici in punto. Ha firmato la ricevuta con una grafia minuta, inclinata all'indietro. Il sottoscritto ne certifica l'identità con piena cognizione di causa: lo vede ogni mattina nello specchio.

  > La famiglia conserva la tenuta, il laboratorio e il nome. Umber, d'ora in poi, avrà soltanto la chiave. Il sottoscritto ritiene che, per un uomo che ha sempre usato la porta sul retro, sia più che sufficiente.

  > La famiglia ha assistito alla consegna in silenzio, nello studio del sottoscritto, seduta in fila come a un funerale. Il beneficiario ha stretto la mano a ciascuno, ha chiamato ciascuno per nome, e ha chiesto notizie della salute di tutti. Conosceva ogni nome, ogni malattia, ogni debito. Ha detto che era un piacere, finalmente, conoscersi di persona.
  if $aiutiEzra > 0:
    > Il sottoscritto ringrazia gli eredi che, nei mesi scorsi, gli hanno portato in segreto quanto richiesto. Senza il loro aiuto la presente esecuzione non sarebbe stata possibile.
  if $boccette == "notaio":
    > Il beneficiario ritira inoltre le sei boccette vuote affidate al sottoscritto dalla famiglia molti anni fa, e custodite nell'armadio a vetri dello studio. Le ritira lavate.

  > In fede. *E. Pell.* *Umber.*
  include Epilogo
  ! FINE?

:: FinaleConfessione [ending]
  # **La Confessione**
  ui generationEndingContinue enabled=true
  ! **Lettera di {$winner} – *1913.***
  > A chi aprirà il fascicolo, dopo di me.

  > Aprimmo il cancello ai cronisti la mattina dopo il temporale, e raccontammo tutto: il sale, le boccette, il vecchio nella bara di pietre, l'Erede nell'Ombra, il bastone spezzato. I due giornali, per una volta d'accordo, pubblicarono la nostra confessione in prima pagina, e per un mese {$townname} non parlò d'altro.

  > Abbiamo perso il nome. Nessuno ci invita più a cena, la banca ci ha chiuso i conti, e i bambini attraversano la strada quando passiamo. Ma nessuno ci ha arrestati: nessun tribunale sa come processare un uomo per quello che fa il suo altro sé, e nessun giudice ha voluto essere il primo a provarci. Siamo liberi, e soli, e per la prima volta da cinquant'anni dormiamo la notte.

  > Abbiamo confessato tutto. Quasi tutto. Quando il notaio Ezra Pell è morto, a dicembre, abbiamo trovato in fondo al suo fascicolo una pagina che non aveva mai mostrato a nessuno, nella grafia inclinata all'indietro: *Hanno confessato tutto quello che sapevano. Non sapevano di me.*

  > I bambini della città, adesso, cantano una filastrocca nuova, saltando la corda: *Umber, Umber, chi sarà? Era lì, e non è più qua.* Quando passiamo noi non smettono di cantare. Ci guardano, sorridono, e qualcuno, ogni tanto, ci saluta con la mano.
  if $stampa == "liberale":
    > Il giornale liberale, che anni prima aveva scritto che Umber era un ricco annoiato, ha pubblicato la nostra confessione con un titolo che ci ha fatto ridere: *Lo avevamo detto.*
  elif $stampa == "conservatore":
    > Il giornale conservatore, che anni prima aveva mandato la polizia nei dormitori dei poveri, ha pubblicato la nostra confessione in ultima pagina, tra gli annunci mortuari. Ce lo meritavamo.
  include Epilogo
  ! FINE?

:: FinaleLettera [ending]
  # **La Lettera Sigillata**
  ui generationEndingContinue enabled=true
  ! **Nota a margine del registro dello studio notarile Pell – *dicembre 1913.***
  > Il notaio Ezra Pell è deceduto il giorno 2 del mese corrente, nel suo studio, per cause naturali. Il medico che ne ha constatato la morte ha visto il corpo.

  > Il testamento del defunto non è stato eseguito, e la famiglia della tenuta ha chiesto che i documenti restino sigillati. Il fascicolo intestato alla famiglia, sigillato e con la scritta *da aprire dopo la mia morte*, è stato ritirato il giorno 3, prima che lo si aprisse, da un signore piccolo di statura, con un cappotto nero troppo largo, munito di regolare delega firmata dal defunto. La firma è stata verificata ed è autentica. Pende all'indietro.

  > Il signore ha ringraziato, ha messo il fascicolo sotto il braccio ed è uscito dalla porta di servizio, fischiettando. Il sottoscritto, impiegato dello studio, ritiene di doverlo annotare, perché lo studio non ha una porta di servizio.

  > Il sottoscritto aggiunge, per completezza, che nella poltrona del defunto, quella davanti alla credenza vuota, è stato trovato un cappello nero da uomo, di misura piccola, che nessuno dello studio ricorda di aver mai visto. È stato consegnato all'ufficio degli oggetti smarriti, dove nessuno, finora, è venuto a reclamarlo.
  if $indizi >= 3:
    > Si annota infine che, dieci minuti dopo, si sono presentati allo studio gli eredi della tenuta, accompagnati da Ada Haskett, ispettore in pensione, chiedendo del fascicolo e delle carte personali del defunto. Sono arrivati tardi. Uno di loro, prima di andarsene, ha chiesto di vedere la firma sulla delega, e l'ha guardata a lungo senza dire niente.
  if $boccette == "notaio":
    > Si annota inoltre che dall'armadio a vetri dello studio mancano sei boccette di vetro scuro, vuote, appartenenti alla famiglia della tenuta. Il commesso non sa dire quando siano sparite.
  include Epilogo
  ! FINE?
