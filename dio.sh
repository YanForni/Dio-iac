#!/bin/bash
echo "Exluindo diretórios"

cd /
rm -Rf /publico/
rm -Rf /adm/
rm -Rf /ven/
rm -Rf /sec/

echo "Diretórios excluídos."
#------------------------------------------------------------------
echo "Excluindo usuários"

userdel -r maisa
userdel -r daniel
userdel -r debora
userdel -r rodrigo
userdel -r mariana

echo "Usuários excluídos."
#------------------------------------------------------------------
echo "Criando diretórios"

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Diretórios criados."
#------------------------------------------------------------------
echo "Criando grupos de usuários"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos de usuários criados."
#------------------------------------------------------------------
echo "Criando usuários e adicionando nos grupos"

useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC


echo "Usuários criados."
#------------------------------------------------------------------
echo "Especificando permissões dos diretórios."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Permissões de diretórios especificadas."

echo "Fim."
