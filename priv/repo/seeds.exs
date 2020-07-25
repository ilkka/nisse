# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Nisse.Repo.insert!(%Nisse.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
viirivehka =
  Nisse.Repo.insert!(%Nisse.Plants.PlantSpecies{
    name: "Spathiphyllum cochlearispathum",
    common_name: "Viirivehka",
    care_instructions: """
    Viirivehka on kaunista kukoistusta kotiin luova ikivihreä kasvi. Viirivehka on kotoisin Etelä-Amerikasta ja viirivehkan sukuun kuuluu useampia kymmeniä eri lajeja. Eri lajikkeiden välillä on vain pieniä eroja ja niitä hoidetaan kaikkia samankaltaisesti.

    Viirivehka on ruohovartinen ja näyttävä perenna, jolla on suuret pitkulaiset tummanvihreät lehdet. Lehdet kasvavat lehtiruusukkeena kasvualustasta. Kukkiessaan viirivehka kasvattaa lehtiruusukkeen keskeltä pitkän kukkavarren, jonka päähän muodostuu näyttävä kukka. Kukalla on suuri puhtaanvalkoinen suojuslehti ja suojuslehden sisällä tähkämäinen keltainen kukinto. Kukinto itsessään kannattaa poistaa ennen kuin se alkaa erittämään siitepölyä, koska se voi aiheuttaa oireita allergisille. Vaikka kukinnon poistaa, säilyy suojalehti vielä jopa viikkoja. Viirivehka on harvinainen trooppinen kasvi siinä mielessä että se kukkii sisätiloissa toistuvasti.

    Viirivehka puhdistaa tehokkaasti huoneilmaa, joten kauneutensa lisäksi sillä on muitakin hyötyjä.

    Viirivehka on hieman myrkyllinen kasvi, joka voi aiheuttaa kosketuksessa iho-oireita.

    Viirivehkaa kastellaan kerralla runsaammin
    Kasvienhoito - Kastelu	Kastelu
    Kastele säännöllisesti, noin viikon välein, varsinkin kesän kasvukaudella huhtikuusta elokuuhun. Kastele kerralla runsaasti ja anna pintamullan kuivahtaa vain kevyesti kastelujen välillä. Talvella anna pintamullan kuivahtaa astetta reilummin kastelujen välillä. Viirivehka sopii erinomaisesti  myös altakasteluruukkuun.Viirivehka nauttii kosteasta ilmasta, joten sumuttele välillä. Pyyhi myös lehtiä aika ajoin kostealla pyyhkeellä kiillon lisäämiseksi ja tuholaisten torjumiseksi. Liian kuiva ilman houkuttelee kasviin tuholaisia.
    Kasvienhoito - Ravinteet	Lannoitus
    Lannoita viirivehkaa säännöllisesti keväästä syksyyn. Älä anna ravinteita talvella koska se saattaa tappaa kasvin.
    Kasvienhoito - Valontarve	Valon tarve ja lämpötila
    Viirivehka nauttii kesäisin varjosta tai puolivarjosta. Talvella viileämmässä kannattaa sijoittaa kirkkaampaan paikkaan. Viihtyy parhaiten 15-25 asteen lämpötilassa. Jos valoa on liian vähän, viirivehka ei ala kukkimaan.
    Kasvienhoito - Kukinta	Kukinta-aika
    kukkii yleensä kevään aikana, mutta kasvuolosuhteista riippuen voi kukkia mihin aikaan vuodesta tahansa.
    Kasvienhoito - lisääminen	Viirivehkan jakaminen
    Viirivehka lisätään jakamalla kasvi kukinnanjälkeisen mullanvaihdon yhteydessä. Viirivehka ei ole turhan tarkka, joten jakaminen voi onnistua minä vuodenaikana tahansa. Suositeltu ajankohta on kuitenkin aikaisin keväällä.
    Jakaminen onnistuu parhaiten poistamalla kasvi varovasti ruukusta ja puhdistamalla juuripaakusta irtoava multa. Jaa kasvi varovasti käsin tai esim. veitsen avulla. Jokainen kasvin osa, jossa on lehtivarsi ja terveitä juuria ovat uuden viirivehkan alku.

    Kasvienhoitovinkit	Vinkkejä
    Leikkaa pois vanhat kukkavarret uusien kukintojen tieltä. Kukinto on tiensä päässä kun suojuslehti alkaa käpristymään ja vaihtaa väriään vihertäväksi. Istuta kasvi uudestaan noin 1-2 vuoden välein kukinnan jälkeen.
    """
  })

peikonlehti =
  Nisse.Repo.insert!(%Nisse.Plants.PlantSpecies{
    name: "Monstera deliciosa",
    common_name: "Peikonlehti",
    care_instructions: """
    Peikonlehti eli jättipeikonlehti on näyttävä ja kookas vihersisustuskasvi. Peikonlehti voi kasvaa sisätiloissakin valtavaksi ja sitä kannattaa tukea tukikepeillä tai asettamalla esimerkiksi seinää vasten. Peikonlehden lehdet ovat aluksi herttamaiset, mutta vanhetessaan ne liuskottuvat sekä reikiintyvät tunnusomaiseen muotoonsa ja kasvavat jopa yli 50-60 cm leveiksi. Liuskoittumisen tarkoitus on suojata lehdet voimakasta tuulta vastaan etteivät ne vahingoitu. Lehtien pinta on nahkea, mikä vähentää veden haihtumista lehden pinnan kautta. Peikonlehti itsessään voi kasvaa jopa puolentoista metrin korkeuteen.

    Peikonlehti on yksi tunnetuimmista ja suosituimmista huonekasveista Suomessa.

    Peikonlehden ilmajuuri: Peikonlehden ikääntyessä alkaa sen varresta kasvamaan pitkiä ruskeita puumaisia versoja, jotka ovat ilmajuuria. Ilmajuuria ei kannata katkaista, koska peikonlehti kuluttaa turhaan energiaa kasvattaessaan heti uusia. Ilmajuuret kannattaa ohjata multaan, jolloin ne alkavat kasvamaan normaalien juurten tavoin. Luonnonvaraisena Meksikon trooppisilla alueilla jättipeikonlehti kasvaa liaanina kiiveten ilmajuuriensa avulla puiden runkoja pitkin aina niiden latvaan asti. Ilmajuurien seinään kiinnittyminen kannattaa kuitenkin estää vaikka sitten katkaisemalla se, ettei seinään jää jälkiä ilmajuuren kiinnittyessä.

    Peikonlehden kukinta: Peikonlehti kukkii vain harvoin ja tuskin koskaan sisätiloissa. Mikäli kasvia hoidetaan oikein ja se saa riittävästi kirkasta valoa, saattaa se kukkia maissintähkän näköisellä kukinnolla jota suojaa suuri kellertävä suojuslehti. Kukasta kehittyy vuoden ajan kypsyttyään syötäväksi kelpaava hieman käpyä muistuttava hedelmä, jonka hedelmäliha pistelee suussa sen sisältävän oksalaatin vuoksi. Raa’an hedelmän on sanottu olevan myrkyllinen, joten odota maltilla sen kypsymistä. Hedelmän kypsymiseen voi mennä jopa vuosi.

    Peikonlehti on suhteellisen helppo kasvi hoitaa, joten se sopii erinomaisesti suurta kasvia haluavalle aloittelevalle viherpeukalolle.

    Peikonlehden kastelu, lannoitus ja valon tarve
    Kasvienhoito - Kastelu	Kastelu
    Peikonlehteä kastellaan tasaisesti ympäri vuoden, mutta kesällä runsaammin. Talvella viileämmässä veden tarve laskee hieman. Nauttii korkeasta ilmankosteudesta, joten tarvittaessa sumuttele usein, mielellään jopa päivittäin. Mitä lämpimämmässä peikonlehti on, sitä useammin sitä olisi sumuteltava. Lehtien kärjet rusehtuvat liian kuivassa ilmassa ja veden puute voi aiheuttaa laikkuja lehtiin. Alhainen ilmankosteus altistaa peikonlehden vihannespunkeille, jotka voivat ilmaantua todella nopeastikin. Punkit ovat pieniä ja ovat nähtävissä suurennuslasilla. Vihannespunkkeja voi yrittää torjua suihkuttamalla kasvia laimealla (2-3 %) mäntysaippualiouksella tai tarkoitukseen kehitetyllä torjunta-aineella.
    Kasvienhoito - Ravinteet	Lannoitus ja kasvualusta
    Peikonlehden kasvualustamullan on hyvä olla ravinteikasta, ilmavaa ja hieman hiekkaista. Normaalissa ruukussa toimii erinomaisesti Kekkilän Kukkamulta, ja altakasteluruukuissa Kestomulta.

    Vaatii melko paljon ravinteita ja olisikin hyvä lannoittaa viikon-kahdenviikon välein huhtikuusta syyskuuhun. Sopivia ravinteita maljaköynnökselle löytyy mm. Kekkilän kukkaravinne. Jos et halua olla jatkuvasti lisäämässä ravinteita, voit käyttää Substral Kasviravinnepuikkoja kerran kahdessa kuussa vaihdettuna.

    Talvikaudenkin aikana ravinteita voi muutaman kerran antaa.

    Kasvienhoito - Valontarve	Valon tarve ja lämpötila
    Peikonlehti nauttii kirkkaasta valosta, jolloin lehdet voivat hyvin, mutta sietää hyvin myös puolivarjoa. Älä sijoita suoraan auringon paahteeseen. Viihtyy parhaiten 18-22 °C asteen lämpötilassa. Alin lämpötila talvella 10 °C.
    Kasvienhoito - Kukinta	Kukinta
    Peikonlehti kukii erittäin harvoin ja vain mikäli kasvuolosuhteet ovat suotuisat. Kukkiessaan muodostaa suuren suojuslehden sisään tähkämäisen kellertävän kukinnon. Kukinnosta muodostuu myöhemmin hieman kuusenkäpyä muistuttava hedelmä, joka on syötävä täysin kypsänä.
    Kasvienhoito - Talvehtiminen	Talvehtiminen
    Peikonlehti talvehtii mielellään viileässä, noin 18 °C asteen lämpötilassa ja valoisassa paikassa. Talvella riittää yleensä kertakastelu viikkoon.
    Kasvienhoito - lisääminen	Lisääminen
    Peikonlehden lisääminen onnistuu latvaversosta, jossa muutamia ilmajuuria. Istuta kosteaan multaan niin että ilmajuuri jää mullan alle, jolloin se muuttuu tavalliseksi juureksi. Iäkkäämpiä kasveja voidaan lisätä myös sivuversoista, jotka voidaan irroittaa ja istuttaa omiin ruukkuihinsa.
    Kasvienhoitovinkit	Vinkkejä
    Pyyhi lehtiä silloin tällöin kostealla liinalla. Tarvittaessa leikkaa versoja kasvun hillitsemiseksi. Istuta nuoret kasvit uudelleen joka kevät. Iäkkäämmät peikonlehdet ovat tyytyväisiä pintamullan vaihtamiseen.
    """
  })

kirjovehka =
  Nisse.Repo.insert!(%Nisse.Plants.PlantSpecies{
    name: "Dieffenbachia seguine",
    common_name: "Kirjovehka",
    care_instructions: """
    HUONEKASVIT
    KIRJOVEHKA
    Dieffenbachia seguine
    Kirjovehkat ovat suosituimpia viherkasveja, sillä ne ovat erittäin sopeutuvaisia, nopeakasvuisia ja koristeellisia huonekasveja. Kirjovehkasta on monia eri lajikkeita, jotka eroavat toisistaan lehtien muodon, värin ja kuvioinnin perusteella.

    SUOSITTELEMME
    MULTA
    Kukkamulta

    LANNOITE
    Kukkaravinne

    VÄRIT


    Istutus ja kasvupaikka
    Kirjovehka tunnetaan myös nimellä Täpläkirjovehka.  Sademetsästä kotoisin olevalla kirjovehkalla on paksu ja suora ruohovartinen runko, josta kasvavat kookkaat lehdet. Lehdet ovat väritykseltään vihreät tai tummanvihreät ja niissä on vaaleat tai kellertävät lehtisuonet. Lehdissä on valkeita täpliä tai juovia. Kirjovehkat kasvatetaan yleensä 50-100 cm korkeiksi.

    Kirjovehka muodostaa kukkiessaan vaatimattomia kallamaisia kukintoja, joissa kellertävää puikulakukintoa ympäröi vihertävä suojuslehti. Kukinto syö kukan energiaa ja voi varisuttaa lehtiä. Kukat voi leikata tyvestä pois heti huomattaessa, jolloin kirjovehka säilyy vihreänä ja lehdekkäänä. Kirjovehkan soluneste on erittäin voimakkaasti limakalvoja ärsyttävää ja turvottavaa. Kirjovehkaa pidetään yleisesti huoneilman laatua parantavana viherkasvina.

    Kirjovehkat viihtyvät valoisassa paikassa, mutta selviää vähässäkin valossa. Vaalealehtiset vehkat tarvitsevat valoa tummalehtisiä enemmän. Vähäisessä valossa lehtien värit ja kuvioinnit haalenevat. Ohuet lehdet ovat arkoja suoralle auringon paahteelle. Kirjovehka ei myöskään siedä vetoa. Viihtyy parhaiten 16-25 °C asteessa, alin lämpötila 15°C astetta. Kirjovehkat pitävät ravinteikkaasta, läpäisevästä mullasta. Sopiva multa on Kekkilä Kukkamulta, altakasteluruukuissa käytetään Kekkilä Kestomultaa.

    Hoito-ohje
    Kirjovehkaa kastellaan runsaasti maaliskuusta syyskuuhun, kuitenkin ylikastelua varoen. Talveksi kastelua vähennetään pintamullan kuivahtaa kastelujen välillä. Kasvia lannoitetaan maaliskuusta syyskuuhun 1-2 kertaa viikossa Kekkilä Kukkaravinteella tai Kekkilä Luonnonmukaisella lannoitteella.

    Kirjovehka pitää sumuttelusta, vaikka se sietää kuivaa huoneilmaa yllättävänkin hyvin sen alkuperän huomioon ottaen. Lehtien suihkuttaminen aika ajoin vedellä helpottaa kasvin oloa kuivissa keskuslämmitystiloissa.

    Kirjovehkat istutetaan uuteen Kukkamultaan keväällä. Kirjovehka on nopeakasvuinen, joten istutus tehdään entistä isompaan ruukkuun. Samalla kasvia voi leikata tuuheamman kasvuston aikaansaamiseksi ja pituuden hillitsemiseksi. Leikattu latva voidaan laittaa multaan juurtumaan uuden kasvin aluksi.

    Kirjovehka ilmoittaa herkästi laiminlyödystä hoidosta. Liian vähäinen kastelu tai kuiva ilma kellastaa lehdet tai ruskettaa niiden reunat.
    """
  })

olohuone = Nisse.Repo.insert!(%Nisse.Plants.Room{label: "Olohuone"})

komootti =
  Nisse.Repo.insert!(%Nisse.Plants.Spot{
    label: "Komootti",
    light_direction: "NE",
    light_level: "medium",
    temperature: "medium",
    room_id: olohuone.id
  })

kaiutin =
  Nisse.Repo.insert!(%Nisse.Plants.Spot{
    label: "Kaiutin",
    light_direction: "E",
    light_level: "low",
    temperature: "medium",
    room_id: olohuone.id
  })

ikkuna =
  Nisse.Repo.insert!(%Nisse.Plants.Spot{
    label: "Ikkuna",
    light_direction: "N",
    light_level: "medium",
    temperature: "medium",
    room_id: olohuone.id
  })

Nisse.Repo.insert!(%Nisse.Plants.Plant{
  name: "Viirivehka",
  acquired_on: ~D[2020-06-29],
  species_id: viirivehka.id,
  spot_id: ikkuna.id
})

Nisse.Repo.insert!(%Nisse.Plants.Plant{
  name: "Peikonlehti",
  acquired_on: ~D[2020-06-14],
  species_id: peikonlehti.id,
  spot_id: komootti.id
})

Nisse.Repo.insert!(%Nisse.Plants.Plant{
  name: "Kirjovehka",
  acquired_on: ~D[2020-06-28],
  species_id: kirjovehka.id,
  spot_id: kaiutin.id
})
