/**
 * @param {string[]} votes
 * @return {string}
 */
// https://leetcode.com/problems/rank-teams-by-votes
// 59.36%
var rankTeams = function (votes) {
  if (votes && votes.length >= 1) {
    if (votes.length === 1) {
      return votes[0]
    }

    let result = ""
    const len = votes[0].length
    let i = 0

    // 记录各个球队得分情况
    let map = new Map()

    // 分别处理每列
    while (i < len) {

      let j = 0

      while (j < votes.length) {
        const vote = votes[j]
        const ch = vote[i]

        let value = 0

        // 记录分数
        if (map.has(ch)) {
          value = map.get(ch)
        }

        value += Math.pow(1001, (26 - i - 1))
        map.set(ch, value)

        j += 1
      }

      i += 1
    }

    const sortedMap = new Map([...map].sort((a, b) => {
      // 先按个数排序
      if (a[1] > b[1]) {
        return -1
      } else if (a[1] < b[1]) {
        return 1
      }

      // 按字顺序排序
      if (a[0] < b[0]) {
        return -1
      } else if (a[0] > b[0]) {
        return 1
      }

      return 0
    }))

    const keys = [...sortedMap.keys()]
    keys.forEach(key => {
      result += key
    })

    return result
  }
}

// 11.11%
var rankTeams2 = function (votes) {
  if (votes && votes.length >= 1) {
    if (votes.length === 1) {
      return votes[0]
    }

    let result = ""
    const len = votes[0].length
    let i = 0

    // 记录各个球队得分情况，key 为球队名，value 为球队在各个位置的得分，比如 {{'A':[1, 0, 0, ...]}}
    let map = new Map()

    // 分别处理每列
    while (i < len) {

      let j = 0

      while (j < votes.length) {
        const vote = votes[j]
        const ch = vote[i]

        let list

        // 记录分数
        if (map.has(ch)) {
          list = map.get(ch)
          list[i] += 1
        } else {
          // 默认 len 个位置
          list = new Array(len)
          let m = 0
          while (m < len) {
            list[m] = 0
            m += 1
          }

          list[i] = 1
        }

        map.set(ch, list)

        j += 1
      }

      i += 1
    }

    console.log(map)

    // 排序
    const sortedMap = new Map([...map].sort((a, b) => {
      // 逐个比较 b 中每个位置上得分
      const list1 = a[1]
      const list2 = b[1]

      let i = 0
      while (i < len) {
        // 按分数大小排
        if (list1[i] != list2[i]) {
          if (list1[i] > list2[i]) {
            return -1
          } else {
            return 1
          }
        }

        i += 1
      }

      // 按字顺序排序
      if (a[0] < b[0]) {
        return -1
      } else if (a[0] > b[0]) {
        return 1
      }
      return 0
    }))

    const keys = [...sortedMap.keys()]
    keys.forEach(key => {
      result += key
    })

    return result
  }
}

// const votes = ["PGAOFXIKYJVSLTUHCZQRE", "LSIAPTHYCGURKEZXJOFQV", "UGSARZICOXYPHTQFJKVEL", "XIAOKSVGRJCHQZUETLYPF", "OHRXPGEVUYCSKZILQATFJ", "UHFSCZVKIELGOQJYRXPAT", "QECXVZKJTLIYHUFRGOSAP", "RJGAZIKPEVUSTOXFQYCHL", "XRFGPAQSJOETHVCZIKLUY", "ZCTQOVRFKXJGEALSHIYUP", "QGTEHXCJRIPSUZALOYFVK", "GIHXVJPQYOSZFRKLEUTAC", "LURXHFECKZSYPTQGAOJVI", "TFUKZELVARQCXIYPJHGSO", "FIPYTACSXZKLRGOHJVEQU", "ZKJQOGHVURAISXFLPYECT", "XKOJAHVQUCETFPRYZGLSI", "TUKZAVIFXEGQCSOLJRPHY", "OSIPCFVRLAYKEHZTJGUQX", "OYAQTCEKLGPRZVISUXFHJ", "SKHCXEZLTFVQOIUPRAJGY", "CRZPAEILFTOKUJVGXHQYS", "OQVLPEYZFIGJRKUSXAHTC", "VQTXURZKAPGHEIFCOLSJY", "YVRZKXSOAEIPUQJHGCFLT", "YEJTGFQPOZLCARSUIKVHX", "XKASIECRHVQFPULZTOGJY", "KAQVYSZLTFXCGEJIRUHOP", "IYJXCUTOAPQKHEZFGRVSL", "OIEPRLZGUVQHSYJAFTXCK", "CIGVAZLKORXQYPHTEUSFJ", "UVTCJFQOGXIZHLKYRASEP", "FCVOYSJHZLKATXRIUPQGE", "TJLQFSRKIUGPCVZHOEAXY", "FUHLSRGTCOXAEZVQIYKPJ", "CAGRHEUQZISYKXLFVPJOT", "LASKUHEPJQXRCTZOVIYFG", "IGKJSYLVFCUXETRAHZQPO", "UZGXPIAFVOSLKRYQJTCHE", "VKELXAFPOGSRIZCUQYTHJ", "GCTJEUFRVLKAIOYSHZXQP", "PHUOAXLYFTCRSEQIKGJZV", "XLQYSIJHTREFPOKCUGVAZ", "LUZXHQKIATOCGJYPFSVRE", "XILVQZAFUKECYJGTPHSOR", "GCQFHJKTAERVPIYUSZOLX", "ZPRILGHYXTFVSQCAUKEOJ", "SLFTYQPZKUAIVGRHEOCXJ", "FCUVEOKHGZQSYJRXPAILT", "AKZJRQCPVHYGSXLFITUOE", "OKVEHCXPYRUGIAZJQFSLT", "YZVHPIGSLREJQCXOKFATU", "QTCILUZFVYHSAPGJEKXRO", "YXKJOPHIVGARUTZEFLSCQ", "OZPXURLHEKFQTSIVJYGCA", "YIVEGRJLTPOAZFCQSUXHK", "VPQUXLYGACSITFKEJHORZ", "AOEQLYPFZUXCKHSTVIJRG", "IFYTULEXKZRCOHASQPJGV", "TASULVYKZPOCGIHJERXFQ", "RGXYZCHVEAPTJISQUFKOL", "XKVRTHJSLOZPIAYUEQGFC", "EYIRXQTCUPHSVJFZLAKOG", "ZRJSTQIGPELKUCHAOYVFX", "EIXJPTZGRKVYCUFAOHQLS", "LRSGUJZYXCIVQOAHTFPEK", "ZHLOESVGIARXCUQYKPFJT", "ZKQLVGOIFASTPUHYJRCXE", "ZLPJQYTXEGAFHOSRCIUVK", "ZVHYQJXCGTAFKLEISOPUR", "KZGLYEQAURFHSXIVPTJCO", "TIXPAYEKJLVGCQRUHOSZF", "ESORYCVXLPKZFQJAUGIHT", "FAJTCHORZGLIKXYSVUPQE", "AOXHJEZFYLIQCPRVTSGKU", "IZVAPOTEHCJQLKRGFUSXY", "RTVYZHSIPGCEKJQUAXFOL", "GSHOKEXAZCIQYTRJFVLPU", "SXZLKIUGEVCPFHTQJARYO", "QPCOTHISGLKYJFUAZXVRE", "XPUEYATJHCOLVGSQRIZKF", "GIKSZFHEQLTCVXJAYOPUR", "RFSOEJPUAGKYHZIQCTLXV", "UFHXJLITQPEGCKOSZYRAV", "ZVQAFGXEIRSTPJYLHCOKU", "ZITVJLSOAUGPCFYXHRQKE", "RCZOIPEXFJAQGSYVLKHUT", "TUHVJROCXIGEPLQAZYKSF", "ATQJGKUIPLZXEYCRSOVFH", "TVHYLSRAKIXJFGEPOZUCQ", "CAPHZLGXQSIRTJYFOKEVU", "FAYOKHEUZIRJXQTVGCSPL", "IJCRUHVAPFYKGXLTSOQEZ", "ZKIJLQEAUVHFTYRXCSGOP", "ALFTJSRXUQPIOVZCYHEKG", "ZASIVJQYUCRPEKGLTXFHO", "OICQXZPEFUSTVALKGYRJH", "ZOKVPHUXGRQIJCSEYALFT", "FKACPHOSIREGUTYLJXZVQ", "IZXOREFGSLPKUHAYCVTJQ", "UVXZTCFAQEYLORSKHPJIG", "PKVQCYSTLHRZIFAUEXJGO", "IRFZSKGEHQVOLXCTJUPAY", "XYHPVOTILEAUZJGSKQCRF", "ERXJLFZQIGHPCSTYKUVOA", "SZTIFCGVEKUJYPAOQXHRL", "JPTGQOEYFIKURCVHXALZS", "URJGTXZKICAOQSLVEYHFP", "ZERGKOLTSUIXJFACVQHPY", "GQCVAJYIKRZLTPSFHOUEX", "OKRCTSGLZXQJEHPFVYUIA", "GUKXARTQFYSCVEZIOJHLP", "UTCIRLFHGJOSYZVPQKEAX", "JPIOVSFZHUTQKCERXAGLY", "LKJEGOHRTYQFXUSCVIPZA", "LSETPUAHZYOICVRGJFXKQ", "OPGHRVUXQEYLZFISTJKCA", "VOKCSGFTXZEIRYALHJPQU", "POTXFYCQIVZHLGJERAUSK", "FAUIECXOYPLRHJKTSZQVG", "XFAETYRCJUGVPQZOKSLHI", "LGCVYIAZRFJSHQXTKUOPE", "YKATQFIURCHPLSVGJEXOZ", "IRUHTAXVYZKFPSEOJCLGQ", "TAVEXIHLPOGSZRCJFQKUY", "GFACLJSETKIXRZUYHVPOQ", "XTJKSAZIQYRCLPGOHUFEV", "GSFTZLJCVKRYUOXAQIEPH", "GIOLPRXHCSUFKAVTJZEQY", "SFCRPVGYKOUZJALQEXHIT", "EUTOKQGFCLRAVZPJYSXHI", "UOYSHGLTPZXRICFJEKAVQ", "OTZIGVXSQHCPRYUKELAJF", "SGZOEHLKYUPXCJRFTAVQI", "JOCVZLGSUIAHPFKYTQERX", "ZFSRJULQGKIOXEPYHTACV", "FGSJCIYXHEAZTOLUKRVQP", "YXHICZVFTSQJKLPOURGAE", "XALRUOHJZYVEGQPKCSFIT", "KCIJLRXYHAESGFQUOPVZT", "AUTSXLECOGPZIHRVYQKFJ", "GIZRAKEVOXLTCJSUHQPFY", "ZKUPCORTFYEIAGJQXVLHS", "JALHXZQIYSUROPCEGKVFT", "KUIGTSQAJEOZYPCFHLXRV", "LXICRFZJEUVYASPKQHTOG", "EFUPZKRXLCAVJGQITHOSY", "EUYGQKARZJVHLIPFCOSTX", "AOXTKHRYLJZQEUCSPGVIF", "SHUTLZEGRJYPCVAFXQOKI", "GUZTAXQLKIRFYEOHJSPVC", "RGOZPAXLYVJSHFICKTQUE", "ASCHFQVTRLEKYUZIXGJPO", "CQFRUSIXLOZPVJTGYAHEK", "VGYURSHEXIKCFOAPTQLJZ", "VFQCGPEAYISTXKORLUJHZ", "UZJOYGVRETFSPLQAIKHCX", "JKQRZFXICESTHPGOUYVAL", "XGFYRJKCVTESZPHLQUIOA", "YEPGFRALQOKJTXSZCIUVH", "CXHPFAYKVZQORLJUTEGSI", "PXHACSGJUILTYVQRFKEOZ", "RSILHFAYCQJKVUGZTPXOE", "IKAEOXFVPHSLRCQGZYJTU", "GVKRJFLXZUOSAEIYPTCQH", "TEXZOUVPICHGFLRYSQKAJ", "JCEHLTRZQVFOPUSIKGYXA", "GFLJHYXEAQTOPSKIUZVRC", "ZGKJFVEAUHIXRTCLSPYQO", "GXOTELHIQKUAFSVRPZYCJ", "XRZEUGOIVAKSYPHJQCFLT", "PYQVXGHSAKLRFTEZOUICJ", "QGHOCVKFEPUTSRAIJYZLX", "YRQVOLKJGFIXHEPCTUAZS", "CTXYFQVZASEHPIOUJGRLK", "GIZHRVQLJEYAKTSUCOPXF", "XIGKSCLTRYJHZFUOQAPVE", "RYCXPSEGIFAULKZTQJVHO", "PXEQTGYSHICLAVRUZKJOF", "AERXGTIHLUZSFKQYVPCJO", "SKTPVFXILUZHYCEJAQROG", "OCQUZKSJYLIVARFEHTPGX", "ISZXFQUKHJOTCREPGYALV", "LOSTQCIRZFVGYKPEAJHUX", "QPFTRGUKOIVXESYCJZLAH", "PXSUEIVOHZCKJFQLTGRAY", "QYLRCVJOPEXGUTZKSAIFH", "RJQPOFKXIHUZYVETCSLAG", "HTFJEAISYQZUXLCGVPORK", "ECGFLAHQJPORITXYUKVZS", "FJGAIOSPTVXUZYHLQKERC", "GEQLKYPICTUAFRSOVXZHJ", "CGJHEZKSTIUQOFVRYXLAP", "XYJSGTIKOVUFERLHCPAQZ", "LQFVECITUGXHOYJKASRZP", "HYGJQFUPZVORSKICLETXA", "ACTXZRUYPOJLIEFSKQVGH", "PHOLYCFUKRASEGTVQZXIJ", "RTUOEZHPSKAFXLQYICVGJ", "RAPTGQIJOSEFZUKVXCLHY", "EUAKTQLJFOHCPSYVGRZXI", "TYUPHSXVEZKIFQACRLJGO", "ZHOEAIULSVJQKGRYFTXPC", "CPEUIGVRFSOZAKYHQLTJX", "ZCOEYRHVQFLSJIXUATGKP", "FGSCJZKUTRVOLEYHQIPAX", "SPKIGAUVQJXZYEHROCFTL", "ITQVPZLEOGJUHKXRYFASC", "GSAFTOHJQCYLUVPZEXRKI", "ZPFKXLUJSRCAHOGYTVIEQ", "QIFYPTAJELCSOXUKRZGVH", "JFGZCQAELXKOIUHYRSTVP", "TIGPACUOYZJHXKSVQEFRL", "EATKLFGOCZVQHXRYSJIPU", "SPOJYHVQXGZELUACKFITR", "YTVIQXEZUJRFGCOLKSAPH", "SPGHEQZJVXKIOAYLRUCFT", "RFXCSUZIJAQTELHKVPOGY", "PHXJESZRGFLKOAVIQUTYC", "GUYCOKILATEJZXHFPRSVQ", "GQTUFLAKCPVRYIOHXEZJS", "AYVCGFTIQKLZSXEPHRJUO", "EAXRUTPZVHCGLISYQFKOJ", "SUVFHQGRLXEZAYJTCIPKO", "PXKTOGRLHQAJFZCIYUSVE", "ZGXYPLOSRCTAVFEUIQKHJ", "OKEHXFQSIZGCRJLPATYUV", "YXQILGVKPJOUTAZRCSEHF", "TYQAGXSCZVKLJEOIHPURF", "ELAJZPXRIFQVSGKTOCUHY", "YIPXUJHGACTVQEKSOZRLF", "ZPAGUYLVSRCIKOJXFTEQH", "LYKIJURAEGVZSFPXHCOTQ", "EULYFIOJTGXZQCPARHKSV"]
const votes = ["BCA", "CAB", "CBA", "ABC", "ACB", "BAC"]

console.log(rankTeams(votes))
console.log(rankTeams2(votes))
