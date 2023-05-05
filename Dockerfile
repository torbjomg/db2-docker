# Using the IBM Db2 image as a base
FROM ibmcom/db2

# # Run the bind command to bind the necessary packages
# RUN /bin/bash -c "source /home/db2inst1/sqllib/db2profile \
#     && db2 bind /home/db2inst1/sqllib/bnd/@db2ubind.lst blocking all grant public \
#     && db2 bind /home/db2inst1/sqllib/bnd/@db2cli.lst blocking all grant public"


# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# ENTRYPOINT [ "/entrypoint.sh" ]