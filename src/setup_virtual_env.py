# go to main rivanna shell and run 
module load anaconda/5.2.0-py3.6
conda create -n brandon_env
source activate brandon_env
#source deactivate custom_env
conda install -n brandon_env -c ipykernel
ipython kernel install --user --name=brandon_env

conda install -n brandon_env -c bioconda pandas 
conda install -n brandon_env -c bioconda seaborn 
conda install -n brandon_env -c bioconda altair
conda install -n brandon_env -c bioconda gensim
conda install -n brandon_env -c bioconda psycopg2
conda install -n brandon_env -c bioconda spacy
conda install -n brandon_env -c bioconda nltk

# references 
# https://www.rc.virginia.edu/userinfo/rivanna/software/python/
# http://echrislynch.com/2019/02/01/adding-an-environment-to-jupyter-notebooks/
