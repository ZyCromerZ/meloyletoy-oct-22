for asu in base-r-oss-custom-release base-r-oss-custom-release-uv
do
    git checkout $asu && git pull . base-r-oss-upstream --signoff --no-commit || break
    git commit -sm "Merge Branch 'base-r-oss-upstream ' into $asu"
    git pull . base-r-oss-custom --signoff --no-commit || break
    git commit -sm "Merge Branch 'base-r-oss-custom ' into $asu"
    git checkout $asu-ALMK && git pull . $asu --signoff --no-ff --no-commit || break
    git commit -sm "Merge Branch '$asu' into $asu-ALMK"
    git checkout $asu-SLMK && git pull . base-r-oss-custom-SLMK --signoff --no-commit || break
    git commit -sm "Merge Branch 'base-r-oss-custom-SLMK' into $asu-SLMK"
    git pull . $asu --signoff --no-ff --no-commit || break
    git commit -sm "Merge Branch '$asu' into $asu-SLMK"
done

DoUpNow()
{
    git push --all origin -f || DoUpNow
}
DoUpNow