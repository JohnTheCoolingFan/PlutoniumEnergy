## 1.8.x

| cell                   | U-238 | U-235 | Pu-238 | Pu-239 | Energy (raw, without bonus) |
| ---------------------- | ----- | ----- | ------ | ------ | --------------------------- |
| uranium (normal) x10   | -13   | -1    | 0      | 0      | 80 GJ                       |
| uranium (advanced) x10 | -10   | -1    | +4.5   | +0.02  | 80 GJ                       |
| plutonium x10          | -15   | 0     | 0      | -0.99  | 200 GJ                      |
| MOX (normal) x20       | -11   | 0     | -2     | 0      | 60 GJ                       |
| MOX (breeder) x20      | -55   | 0     | +5     | +8     | 140 GJ                      |
| Uranium (breeder) x10  | -19   | -1    | +8     | +3     | 120 GJ                      |
| Normal Breeder x2      | -19   | 0     | +4     | +1     | 20 GJ                       |

### Highlights:

- Going for mox-breeder for Pu-239 needed for plutonium cells produces an excess of Pu-238 and the only way to get rid of it is a non-breeder MOX, and this entirely skips U-239
- Uranium breeder is sort of a bootstrap for getting Pu-239 going. But, isn't Advanced Nuclear Reprocessing supposed to be the bootstrap? Two-stage bootstrap?
  * Adv. reprocessing lets ypu get the first piece of Pu-239
  * This allows to use a uranium breeder cycle to get more Pu-239 reliably
  * But this is completely undermined by the fact that MOX fuel allows to start a breeder cycle without getting any Pu-239
    + trigger tech unlock? Even then, that basically obsoletes uranium cells...
- MOX fuel normally is just a way to burn U-238 and Pu-238

## 1.9.0 plan so far

Uhhhhh... idk

## Alternative?

> For example, a mixture of 7% plutonium and 93% natural uranium reacts similarly, although not identically, to low-enriched uranium fuel (3 to 5% uranium-235).

> The content of un-burnt plutonium in spent MOX fuel from thermal reactors is significant – greater than 50% of the initial plutonium loading. However, during the burning of MOX the ratio of fissile (odd numbered) isotopes to non-fissile (even) drops from around 65% to 20%, depending on burn up. This makes any attempt to recover the fissile isotopes difficult and any bulk Pu recovered would require such a high fraction of Pu in any second generation MOX that it would be impractical

So, MOX is just a different way to make cells identical to the Uranium ones, while the Plutonium cells are the ones that allow for higher power density. Recovering anything from MOX is futile.

I don't like this idea, it completely changes the ideas of the mod. But, there's one part that soudns interesting to me:

> Recovering anything from MOX is futile.

Since the issue in the "Uranium as bootstrap for Pu-239" is that MOX skips it entirely, remove any MOX reprocessing recipes, maybe make them burn up completely. This would modify the rows of the 1.8.x table like this:

| cell                   | U-238 | U-235 | Pu-238 | Pu-239 | Energy (raw, without bonus) |
| ---------------------- | ----- | ----- | ------ | ------ | --------------------------- |
| MOX (normal) x20       | -15   | 0     | -5     | 0      | 60 GJ                       |
| MOX (breeder) x20      | N/A   | N/A   | N/A    | N/A    | N/A                         |

This makes MOX:
- A U-238 + Pu-238 sink
- A simple fuel option, with no spent cell management

## Additional ideas

> Regular reprocessing of biphasic spent MOX is difficult because of the low solubility of PuO2 in nitric acid

The dissolving step of reprocessing could also output the Plutonium contents immediately, with centrifuging being required for recovering the extra uranium.

Removing Pu-239 from Plutonium fuel cell reprocessing as it serves no purpose really, and reducing the reprocessing Pu-238 output

| cell                   | U-238 | U-235 | Pu-238 | Pu-239 | Energy (raw, without bonus) |
| ---------------------- | ----- | ----- | ------ | ------ | --------------------------- |
| plutonium x10          | -15   | 0     | -2     | -1     | 200 GJ                      |
